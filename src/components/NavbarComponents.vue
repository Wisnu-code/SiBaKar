<template>
    <nav class="blockT mt-0 dark:bg-gray-900 md:mx-20 fixed z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
        <div class="max-w-screen flex flex-wrap items-center justify-between p-4">

            <!-- Logo -->
            <a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
                <img :src='logo' class="h-8">
                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">SiBaKar</span>
            </a>

            <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                <RouterLink to="/login">
                    <button type="button"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login</button>
                </RouterLink>
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
                        <a href="/"
                            class="block py-2 px-3 rounded md:bg-transparent hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 text-gray-900 md:p-0 md:dark:text-blue-500 md:dark:hover:text-blue-500 active:text-blue-500"
                            aria-current="page">Home</a>
                    </li>

                    <!-- About -->
                    <li>
                        <a href="/about"
                            class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">About</a>
                    </li>

                    <!-- Services -->
                    <li>
                        <a href="/service"
                            class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Services</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
import { RouterLink } from 'vue-router';
import logo from '../assets/logo.jpg'

export default {
    data() {
        return {
            isMenuOpen: false, // Untuk melacak status apakah menu burger terbuka atau tidak
            isDesktop: window.innerWidth >= 768 // Untuk melacak apakah tampilan dalam mode desktop
        };
    },
    methods: {
        toggleMenu() {
            this.isMenuOpen = !this.isMenuOpen; // Toggle status menu
        },
        checkWindowSize() {
            this.isDesktop = window.innerWidth >= 768; // Update status isDesktop berdasarkan lebar layar
            if (this.isDesktop) {
                this.isMenuOpen = false; // Menutup menu saat berpindah ke desktop
            }
        }
    },
    mounted() {
        window.addEventListener('resize', this.checkWindowSize); // Menambahkan event listener resize saat komponen di-mount
    },
    beforeUnmount() {
        window.removeEventListener('resize', this.checkWindowSize); // Membersihkan event listener sebelum komponen dihancurkan
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
</style>

<style>
@keyframes opacit {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.blockT {
    animation: opacit .5s ease-in-out;
}
</style>