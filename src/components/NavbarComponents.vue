<template>
    <nav class="mt-0 dark:bg-gray-900 md:mx-20 fixed z-20 top-5 start-0 border-b border-gray-200">
        <div class="flex flex-wrap items-center justify-between p-4">

            <!-- Logo -->
            <a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
                <span
                    class="self-center text-2xl font-bold text-[#FF6F3B] whitespace-nowrap dark:text-white">SiBaKar</span>
            </a>

            <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                <RouterLink v-if="!isLoggedIn" to="/login">
                    <button type="button"
                        class="rounded-md border border-[#1B78AF] py-2 px-4 text-center transition-all shadow-sm hover:shadow-lg text-[#1B78AF] hover:text-white hover:bg-[#1B78AF] hover:border-[#1B78AF] focus:text-white focus:bg-[#B4C6D0] focus:border-[#B4C6D0] active:border-[#1B78AF] active:text-white active:bg-[#1B78AF] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none text-xl font-medium">Masuk</button>
                </RouterLink>
                <button v-else @click="handleLogout"
                    class="rounded-md border border-[#C63501] py-2 px-4 text-center transition-all shadow-sm hover:shadow-lg text-[#C63501] hover:text-white hover:bg-[#C63501] hover:border-[#C63501] focus:text-white focus:bg-[#B4C6D0] focus:border-[#B4C6D0] active:border-[#C63501] active:text-white active:bg-[#C63501] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none text-xl font-medium">Keluar</button>
                <button data-collapse-toggle="navbar-sticky" @click="toggleMenu" type="button"
                    class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    aria-controls="navbar-sticky" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 17 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M1 1h15M1 7h15M1 13h15" />
                    </svg>
                </button>
            </div>

            <!-- Menu (always visible in desktop, toggled in mobile) -->
            <div :class="{ 'hidden': !isMenuOpen && !isDesktop, 'block': isMenuOpen || isDesktop, 'md:flex': isDesktop }"
                class="w-[80%] md:w-auto md:order-1" id="navbar-sticky">
                <ul
                    class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">

                    <!-- Home -->
                    <li>
                        <RouterLink to="/" exact active-class="active"
                            class="block py-2 px-3 text-xl rounded md:bg-transparent hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 text-gray-900 md:p-0 md:dark:text-blue-500 md:dark:hover:text-blue-500 md:focus:text-blue-400 from-left hover:font-black"
                            aria-current="page">Beranda</RouterLink>
                    </li>

                    <!-- About -->
                    <li>
                        <RouterLink to="/about" active-class="active"
                            class="block py-2 px-3 text-xl text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700 md:focus:text-blue-400 from-left hover:font-black">
                            Tentang</RouterLink>
                    </li>

                    <!-- Services -->
                    <li v-if="isLoggedIn">
                        <RouterLink to="/service" active-class="active"
                            class="block py-2 px-3 text-xl text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700 md:focus:text-blue-400 from-left hover:font-black">
                            Layanan</RouterLink>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { RouterLink } from 'vue-router';
</script>

<script>
export default {
    beforeRouteEnter(to, from, next) {
        // Jika tidak ada token di localStorage, redirect ke halaman login
        if (!localStorage.getItem('token')) {
            next('/login');
        } else {
            next(); // Lanjutkan ke halaman layanan jika sudah login
        }
    },
    data() {
        return {
            isMenuOpen: false,
            isDesktop: window.innerWidth >= 768,
            isLoggedIn: !!localStorage.getItem('token'), // Cek jika token ada di localStorage
        };
    },
    methods: {
        toggleMenu() {
            this.isMenuOpen = !this.isMenuOpen;
        },
        checkWindowSize() {
            this.isDesktop = window.innerWidth >= 768;
            if (this.isDesktop) {
                this.isMenuOpen = false;
            }
        },
        checkLoginStatus() {
            this.isLoggedIn = !!localStorage.getItem('token'); // Perbarui isLoggedIn
        },
        handleLogout() {
            localStorage.removeItem('token'); // Hapus token
            this.isLoggedIn = false;
            this.$router.push('/'); // Redirect ke halaman utama
        },
    },
    mounted() {
        window.addEventListener('resize', this.checkWindowSize);
        window.addEventListener('storage', this.checkLoginStatus); // Pantau perubahan localStorage
    },
    beforeUnmount() {
        window.removeEventListener('resize', this.checkWindowSize);
        window.removeEventListener('storage', this.checkLoginStatus);
    }
}
</script>

<style scoped>
nav {
    background: rgba(255, 255, 255, 0.25);
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(9.8px);
    -webkit-backdrop-filter: blur(9.8px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    max-width: 100vw;
    width: 100%;
}

@media (min-width: 768px) {
    nav {
        width: calc(100% - 158px);
    }
}

.hidden {
    display: none;
}

.block {
    display: block;
}

.active {
    color: #1B78AF;
    text-transform: uppercase;
    font-weight: 700;
}

.from-left:after {
    display: block;
    content: '';
    width: inherit;
    border-bottom: solid 5px blue;
    transform: scaleX(0);
    transition: transform 250ms ease-in-out;
}

.from-left:hover:after {
    transform: scaleX(1);
}

.from-left:after {
    transform-origin: left;
}

.from-right:after {
    transform-origin: right;
}
</style>