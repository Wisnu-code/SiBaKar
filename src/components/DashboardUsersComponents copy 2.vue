<template>
    <div>
        <SidebarComponents />

        <!-- Modal Konfirmasi Delete -->
        <div v-if="showDeleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-lg font-semibold mb-4">Konfirmasi Hapus</h3>
                <p>Apakah Anda yakin ingin menghapus user ini?</p>
                <div class="mt-4 flex justify-end space-x-3">
                    <button @click="cancelDelete" class="px-4 py-2 bg-gray-200 rounded-lg hover:bg-gray-300">
                        Batal
                    </button>
                    <button @click="confirmDelete" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">
                        Hapus
                    </button>
                </div>
            </div>
        </div>

        <!-- Alert Message -->
        <div v-if="alertMessage" :class="[
            'fixed top-4 right-4 p-4 rounded-lg shadow-lg transition-opacity duration-500',
            alertType === 'success' ? 'bg-green-500 text-white' : 'bg-red-500 text-white'
        ]">
            {{ alertMessage }}
        </div>

        <div class="flex h-[80vh] justify-center items-center md:text-2xl text-xl">
            <div
                class="flex flex-col items-center justify-center bg-gray-50 md:rounded-2xl rounded-xl md:w-[70%] md:h-[80%] h-[100%] shadow-lg overflow-hidden md:p-10 s-b">
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">User Management</div>

                <!-- Search Input -->
                <div class="mb-4 s-r">
                    <div class="relative md:left-60 md:translate-x-[100%] left-16">
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
                                                    Nama</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Username</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Email</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-end font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="(user, index) in filteredData" :key="user.id">
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ index + 1 }}
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ user.fullname }}
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ user.username }}
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap text-end text-sm md:text-lg font-medium">
                                                    <button type="button" @click="confirmDeleteUser(user.id)"
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
            alertMessage: '',
            alertType: 'success',
            showDeleteModal: false,
            selectedUserId: null
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

    // methods: {
    //     async fetchUsers() {
    //         try {
    //             const response = await fetch("http://localhost:8080/users");
    //             if (!response.ok) {
    //                 throw new Error('Failed to fetch users');
    //             }
    //             const data = await response.json();
    //             this.users = data;
    //         } catch (error) {
    //             this.showAlert('Gagal mengambil data user', 'error');
    //             console.error("Failed to fetch users:", error);
    //         }
    //     },

    //     async deleteUser(id) {
    //         if (!confirm('Apakah Anda yakin ingin menghapus user ini?')) {
    //             return;
    //         }

    //         try {
    //             const response = await fetch(`http://localhost:8080/user/delete?id=${id}`, {
    //                 method: 'DELETE',
    //                 headers: {
    //                     'Content-Type': 'application/json',
    //                 },
    //             });

    //             if (!response.ok) {
    //                 throw new Error('Failed to delete user');
    //             }

    //             await this.fetchUsers(); // Refresh data setelah delete berhasil
    //             this.showAlert('User berhasil dihapus', 'success');
    //         } catch (error) {
    //             this.showAlert('Gagal menghapus user', 'error');
    //             console.error("Failed to delete user:", error);
    //         }
    //     },

    //     showAlert(message, type = 'success') {
    //         this.alertMessage = message;
    //         this.alertType = type;
    //         setTimeout(() => {
    //             this.alertMessage = '';
    //         }, 3000);
    //     }
    // },

    methods: {
        async fetchUsers() {
            try {
                const response = await fetch("http://localhost:8080/users");
                if (!response.ok) {
                    throw new Error('Failed to fetch users');
                }
                const data = await response.json();
                this.users = data;
            } catch (error) {
                this.showAlert('Gagal mengambil data user', 'error');
                console.error("Failed to fetch users:", error);
            }
        },

        confirmDeleteUser(id) {
            this.selectedUserId = id;
            this.showDeleteModal = true;
        },

        async confirmDelete() {
            try {
                const response = await fetch(`http://localhost:8080/user/delete?id=${this.selectedUserId}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                });

                if (!response.ok) {
                    throw new Error('Failed to delete user');
                }

                this.fetchUsers(); // Refresh data setelah delete berhasil
                this.showAlert('User berhasil dihapus', 'success');
            } catch (error) {
                this.showAlert('Gagal menghapus user', 'error');
                console.error("Failed to delete user:", error);
            } finally {
                this.showDeleteModal = false;
                this.selectedUserId = null;
            }
        },

        cancelDelete() {
            this.showDeleteModal = false;
            this.selectedUserId = null;
        },

        showAlert(message, type = 'success') {
            this.alertMessage = message;
            this.alertType = type;
            setTimeout(() => {
                this.alertMessage = '';
            }, 3000);
        }
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

<style scoped>
/* Styles for modal and alert */
.modal-enter-active,
.modal-leave-active {
    transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
    opacity: 0;
}
</style>
