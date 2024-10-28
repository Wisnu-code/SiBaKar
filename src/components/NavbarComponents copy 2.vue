<template>
    <nav class="mt-0 dark:bg-gray-900 md:mx-20 fixed z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600 w-[100%]">
        <div class="flex flex-wrap items-center justify-between p-4">

            <!-- Logo -->
            <a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
                <!-- <img :src='logo' class="h-8"> -->
                <span class="self-center text-xl font-bold whitespace-nowrap dark:text-white">SiBaKar</span>
            </a>

            <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                <RouterLink v-if="!isLoggedIn" to="/login">
                    <button type="button"
                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Masuk</button>
                </RouterLink>
                <button v-else @click="handleLogout" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800">
                    Keluar
                </button>
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
                class="w-full md:w-auto md:order-1" id="navbar-sticky">
                <ul
                    class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">

                    <!-- Home -->
                    <li>
                        <RouterLink to="/" exact active-class="active"
                            class="block py-2 px-3 rounded md:bg-transparent hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 text-gray-900 md:p-0 md:dark:text-blue-500 md:dark:hover:text-blue-500 md:focus:text-blue-400"
                            aria-current="page">Beranda</RouterLink>
                    </li>

                    <!-- About -->
                    <li>
                        <RouterLink to="/about" active-class="active"
                            class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700 md:focus:text-blue-400">
                            Tentang</RouterLink>
                    </li>

                    <!-- Services -->
                    <li>
                        <RouterLink to="/service" active-class="active"
                            class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700 md:focus:text-blue-400">
                            Layanan</RouterLink>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
import { RouterLink } from 'vue-router';

export default {
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

/* Highlight class with transition */
.active {
    color: blue;
    font-weight: bold;
    border-bottom: 1px solid blue;
    transition: color 0.8s ease-in-out, font-weight 0.3s ease-in-out;
    transition-delay: 0.8s;
    /* Delay for the transition */
}
</style>