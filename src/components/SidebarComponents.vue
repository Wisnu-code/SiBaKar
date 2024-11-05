<template>
    <div>
        <!-- Loading screen -->
        <div ref="loading"
            class="fixed inset-0 z-50 flex items-center justify-center text-2xl font-semibold text-white bg-blue-600">
            Loading.....
        </div>

        <div class="flex antialiased text-gray-900 bg-gray-800 dark:bg-dark dark:text-light shadow-xl">
            <!-- Sidebar -->
            <transition name="sidebar">
                <div v-show="isSidebarOpen" class="fixed inset-y-0 z-40 flex w-80">
                    <!-- Curvy shape -->
                    <svg class="absolute inset-0 w-full h-full text-white"
                        style="filter: drop-shadow(10px 0 10px #00000030)" preserveAspectRatio="none"
                        viewBox="0 0 309 800" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M268.487 0H0V800H247.32C207.957 725 207.975 492.294 268.487 367.647C329 243 314.906 53.4314 268.487 0Z" />
                    </svg>
                    <!-- Sidebar content -->
                    <div class="z-40 flex flex-col flex-1">
                        <div class="flex items-center justify-between flex-shrink-0 w-64 p-4">
                            <!-- Logo -->
                            <a href="#">
                                <img :src="logo">
                            </a>
                            <!-- Close btn -->
                            <button @click="toggleSidebar" class="p-1 rounded-lg focus:outline-none focus:ring">
                                <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M6 18L18 6M6 6l12 12" />
                                </svg>
                                <span class="sr-only">Close sidebar</span>
                            </button>
                        </div>
                        <nav class="flex flex-col flex-1 w-64 p-4 mt-4">
                            <RouterLink to="/dashboard" active-class="active" class="nav-link flex items-center space-x-2 text-2xl font-medium">
                                <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                                </svg>
                                <span>Home</span>
                            </RouterLink>
                            <RouterLink to="/users" active-class="active" class="nav-link mt-4 flex items-center space-x-2 text-2xl font-medium">
                                <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 40 40" stroke="currentColor">
                                    <circle cx="20" cy="12" r="8" stroke-width="2"/>
                                    <path d="M8 32c0-8 6-12 12-12s12 4 12 12" 
                                        stroke-width="2" stroke-linecap="round"/>
                                </svg>
                                <span>User</span>
                            </RouterLink>
                            <RouterLink to="/chair" active-class="active" class="nav-link mt-4 flex items-center space-x-2 text-2xl font-medium">
                                <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path d="M7 4C7 4 12 3 17 4C17 4 18 8 18 10C18 12 17 14 12 14C7 14 6 12 6 10C6 8 7 4 7 4Z" 
                                        stroke-width="1.5" 
                                        stroke-linecap="round" 
                                        stroke-linejoin="round"/>
                                    <path d="M6 10H18V12C18 12 18 14 12 14C6 14 6 12 6 12V10Z" 
                                        stroke-width="1.5"
                                        stroke-linecap="round" 
                                        stroke-linejoin="round"/>
                                    <path d="M8 14L6 20M16 14L18 20" 
                                        stroke-width="1.5" 
                                        stroke-linecap="round" 
                                        stroke-linejoin="round"/>
                                </svg>
                                <span>Chair</span>
                            </RouterLink>
                        </nav>
                        <div class="flex-shrink-0 p-4">
                            <button class="flex items-center space-x-2">
                                <svg aria-hidden="true" class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                                </svg>
                                <span>Logout</span>
                            </button>
                        </div>
                    </div>
                </div>
            </transition>
            
            <!-- Main content -->
            <main class="flex flex-col items-center justify-center flex-1">
                <button @click="toggleSidebar" class="fixed p-2 text-black bg-white rounded-lg top-5 left-5">
                    <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                    <span class="sr-only">Open menu</span>
                </button>
                <h1 class="sr-only">Home</h1>
                <div class="text-5xl font-semibold uppercase text-white m-10">dashboard</div>
            </main>
        </div>
    </div>
</template>

<script>
import logo from '../assets/logo.jpg';
export default {
    name: 'SidebarComponents',
    data() {
        return {
            isSidebarOpen: false,
            logo: logo 
        };
    },
    mounted() {
        this.$refs.loading.classList.add("hidden");
    },
    methods: {
        toggleSidebar() {
            this.isSidebarOpen = !this.isSidebarOpen;
        },
    },
};
</script>

<style scoped>
@property --offset {
    syntax: '<length>';
    inherits: false;
    initial-value: 0;
}

.sidebar-enter-active,
.sidebar-leave-active {
    transition: transform 0.3s;
}

.sidebar-enter,
.sidebar-leave-to {
    transform: translateX(-100%);
}

.nav-link {
    color: inherit;
    text-decoration: none;
    position: relative;
    transition: color 400ms;
}

.nav-link::after {
    content: '';
    position: absolute;
    bottom: -4px;
    left: 0;
    width: 100%;
    height: 0.15em;
    background-color: #012c47;
    transform: scaleX(0);
    transition: transform 400ms;
}

.nav-link.active {
    color: #0f3e5e;
}

.nav-link.active::after {
    transform: scaleX(1);
}

@supports not (background: paint(something)) {
    .nav-link.active::after {
        transform: none;
        opacity: 1;
    }
}
</style>