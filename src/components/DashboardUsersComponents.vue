<template>
    <div>
        <SidebarComponents />

        <div class="flex h-[80vh] justify-center items-center md:text-2xl text-xl">
            <div
                class="flex flex-col items-center justify-center bg-gray-50 md:rounded-2xl rounded-xl md:w-[70%] md:h-[80%] h-[100%] shadow-lg overflow-hidden md:p-10 s-b">
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">User Management</div>

                <!-- Search Input -->
                <div class="mb-4 s-r">
                    <div class="relative md:left-44 md:translate-x-[100%] left-16">
                        <input type="text" v-model="searchQuery" placeholder="Search..."
                            class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 text-sm">
                        <svg class="absolute left-3 top-2.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg"
                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>
                </div>

                <div class="flex flex-col w-full overflow-auto s-b">
                    <div class="flex flex-col overflow-h-auto overflow-w-auto h-[70%] w-full">
                        <div class="-m-1.5">
                            <div class="p-1.5 min-w-full inline-block align-middle">
                                <div class="">
                                    <table class="min-w-full divide-y divide-gray-200">
                                        <thead>
                                            <tr>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    ID</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Username</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Fullname</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-end font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="user in users" :key="user.id">
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ user.id }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ user.username }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ user.fullname }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-end text-sm md:text-lg font-medium">
                                                    <button type="button" @click="deleteUser(user.id)"
                                                        class="inline-flex items-center gap-x-2 text-sm md:text-lg font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import SidebarComponents from './SidebarComponents.vue';
import ScrollReveal from 'scrollreveal';

export default {
    components: {
        SidebarComponents
    },
    data() {
        return {
            users: [],
            searchQuery: '',
        }
    },

    computed: {
        filteredData() {
            const query = this.searchQuery.toLowerCase();
            return this.users.filter(user => {
                return (
                    user.fullname.toLowerCase().includes(query) ||
                    user.username.toLowerCase().includes(query)
                );
            });
        }
    },

    methods: {
        fetchUsers() {
            fetch("http://localhost:8080/users")
                .then(response => response.json())
                .then(data => {
                    this.users = data; // Pastikan 'users' ada di data() component ini
                })
                .catch(error => {
                    console.error("Error fetching users:", error)
                    this.showAlert('Error fetching data', 'error')
                });
        },
    },

    mounted() {
        this.fetchUsers();

        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000,
            distance: '60px',
            delay: 300,
            reset: false,
        });
        ScrollReveal().reveal('.s-l', { delay: 300, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 600, origin: 'right' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
    }
}
</script>
