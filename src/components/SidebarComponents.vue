<template>
    <div>
        <!-- Loading screen -->
        <div ref="loading"
            class="fixed inset-0 z-50 flex items-center justify-center text-2xl font-semibold text-white bg-blue-600">
            Loading.....
        </div>

        <div class="relative flex antialiased text-gray-900 bg-gray-800 dark:bg-dark dark:text-light shadow-xl z-40">
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
                            <a href="/dashboard">
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
                            <RouterLink to="/report" active-class="active" class="nav-link mt-4 flex items-center space-x-2 text-2xl font-medium">
                                <svg fill="#000000" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52" enable-background="new 0 0 52 52" xml:space="preserve" class="w-6 h-6"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M22.8,45.7v1c0,1.2-0.9,2.1-2.1,2.1h0H4.1c-1.2,0-2.1-0.9-2.1-2.1l0,0v-1c0-2.5,3-4.1,5.7-5.3 c0.1,0,0.2-0.1,0.3-0.2c0.2-0.1,0.5-0.1,0.7,0c1.1,0.7,2.4,1.1,3.8,1.1c1.3,0,2.6-0.4,3.8-1.1c0.2-0.1,0.4-0.1,0.6,0 c0.1,0,0.2,0.1,0.3,0.2C19.9,41.7,22.8,43.2,22.8,45.7z"></path> <ellipse cx="12.4" cy="33.7" rx="5.2" ry="5.7"></ellipse> <path d="M34.8,3.2L34.8,3.2c-8.5,0-15.3,6.5-15.3,14.5c0,2.5,0.7,5,2,7.2c0.1,0.2,0.2,0.5,0.2,0.8L20,30.3 c-0.2,0.6,0.2,1.1,0.7,1.3c0.2,0.1,0.4,0.1,0.6,0l4.5-1.6c0.3-0.1,0.6-0.1,0.8,0.1c2.4,1.4,5.2,2.2,8,2.2c8.5,0,15.3-6.6,15.3-14.6 C50,9.7,43.1,3.2,34.8,3.2z M33.7,8.9h3v7l-0.3,4.6H34l-0.2-4.6V8.9z M35.2,26.2c-1.4,0-1.8-0.8-1.8-1.8c0-1,0.4-1.8,1.8-1.8 c1.4,0,1.8,0.8,1.8,1.8C37.1,25.4,36.6,26.2,35.2,26.2z"></path> </g> </g></svg>
                                <span>Report</span>
                            </RouterLink>
                            <RouterLink to="/event" active-class="active" class="nav-link mt-4 flex items-center space-x-2 text-2xl font-medium">
                                <svg fill="#000000" viewBox="0 0 122.88 122.88" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><title>event-calendar</title><path d="M81.6,4.73C81.6,2.12,84.18,0,87.37,0s5.77,2.12,5.77,4.73V25.45c0,2.61-2.58,4.73-5.77,4.73s-5.77-2.12-5.77-4.73V4.73Zm-19,56.57,6,13.91,15.07,1.35a1.2,1.2,0,0,1,1.1,1.31,1.18,1.18,0,0,1-.41.81h0l-11.41,10,3.37,14.75a1.2,1.2,0,0,1-.91,1.45,1.27,1.27,0,0,1-.94-.17l-13-7.74-13,7.78a1.22,1.22,0,0,1-1.66-.42,1.2,1.2,0,0,1-.14-.9h0L50,88.64l-11.4-10A1.22,1.22,0,0,1,38.48,77a1.26,1.26,0,0,1,.86-.4l15-1.34,6-13.93a1.21,1.21,0,0,1,1.59-.64,1.17,1.17,0,0,1,.65.64ZM29.61,4.73C29.61,2.12,32.19,0,35.38,0s5.77,2.12,5.77,4.73V25.45c0,2.61-2.58,4.73-5.77,4.73s-5.77-2.12-5.77-4.73V4.73ZM6.4,45.32H116.47V21.47a3,3,0,0,0-.86-2.07,2.92,2.92,0,0,0-2.07-.86H103a3.2,3.2,0,1,1,0-6.4h10.55a9.36,9.36,0,0,1,9.33,9.33v92.08a9.36,9.36,0,0,1-9.33,9.33H9.33A9.36,9.36,0,0,1,0,113.54V21.47a9.36,9.36,0,0,1,9.33-9.33H20.6a3.2,3.2,0,1,1,0,6.4H9.33a3,3,0,0,0-2.07.86,2.92,2.92,0,0,0-.86,2.07V45.32Zm110.07,6.41H6.4v61.81a3,3,0,0,0,.86,2.07,2.92,2.92,0,0,0,2.07.86H113.54a3,3,0,0,0,2.07-.86,2.92,2.92,0,0,0,.86-2.07V51.73Zm-66-33.19a3.2,3.2,0,0,1,0-6.4H71.91a3.2,3.2,0,1,1,0,6.4Z"></path></g></svg>
                                <span>Event</span>
                            </RouterLink>
                        </nav>
                        <div class="flex-shrink-0 p-4">
                            <button @click="logout" class="flex items-center space-x-2">
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
            <main class="flex flex-col items-center justify-center flex-1 z-10">
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
            logo: logo ,
        };
    },
    mounted() {
        this.$refs.loading.classList.add("hidden");
    },
    methods: {
        toggleSidebar() {
            this.isSidebarOpen = !this.isSidebarOpen;
        },
        logout() {
            localStorage.removeItem('token');
            this.$router.push('/dashlog')
        }
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