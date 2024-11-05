<template>
    <div>
        <SidebarComponents />

        <!-- Modal Konfirmasi Delete -->
        <div v-if="showDeleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-lg font-semibold mb-4">Konfirmasi Hapus</h3>
                <p>Apakah Anda yakin ingin menghapus booking ini?</p>
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
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">Chair</div>

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
                                                    Divisi</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Bangku</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-end font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="(booking, index) in filteredData" :key="booking.id">
                                                <td 
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ index + 1 }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ booking.namalengkap }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ booking.namadivisi }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ booking.selectedSeat }}</td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-end text-sm md:text-lg font-medium">
                                                    <button type="button" @click="deleteBooking(booking.id)"
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
            bookings: [],
            searchQuery: '',
            alertMessage: '',
            alertType: 'success',
        }
    },

    computed: {
        filteredData() {
            const query = this.searchQuery.toLowerCase();
            return this.bookings.filter(booking => {
                return (
                    booking.namalengkap.toLowerCase().includes(query) ||
                    booking.namadivisi.toLowerCase().includes(query) ||
                    booking.selectedSeat.toLowerCase().includes(query)
                );
            });
        }
    },

    methods: {
        async fetchBookings() {
            try {
                const response = await fetch("http://localhost:8080/bookings");
                if (!response.ok) {
                    throw new Error('Failed to fetch bookings');
                }
                const data = await response.json();
                this.bookings = data;
                console.log('Fetched bookings:', data); // Debugging
            } catch (error) {
                console.error("Failed to fetch bookings:", error);
                this.showAlert('Gagal mengambil data booking', 'error');
            }
        },

        async deleteBooking(id) {
            if (!confirm('Apakah Anda yakin ingin menghapus booking ini?')) {
                return;
            }

            try {
                console.log('Deleting booking with ID:', id); // Debugging
                const response = await fetch(`http://localhost:8080/booking/delete?id=${id}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                });

                if (!response.ok) {
                    throw new Error('Failed to delete booking');
                }

                // Refresh data setelah delete berhasil
                await this.fetchBookings();
                this.showAlert('Booking berhasil dihapus', 'success');
            } catch (error) {
                console.error("Failed to delete booking:", error);
                this.showAlert('Gagal menghapus booking', 'error');
            }
        },

        showAlert(message, type = 'success') {
            this.alertMessage = message;
            this.alertType = type;
            setTimeout(() => {
                this.alertMessage = '';
            }, 3000);
        }
    },

    // methods: {
    //     async fetchBookings() {
    //         try {
    //             const response = await fetch("http://localhost:8080/bookings");
    //             if (!response.ok) {
    //                 throw new Error('Failed to fetch bookings');
    //             }
    //             this.bookings = await response.json();
    //         } catch (error) {
    //             this.showAlert('Gagal mengambil data booking', 'error');
    //             console.error("Failed to fetch bookings:", error);
    //         }
    //     },

    //     initiateDelete(booking) {
    //         this.selectedBooking = booking;
    //         this.showDeleteModal = true;
    //     },

    //     cancelDelete() {
    //         this.showDeleteModal = false;
    //         this.selectedBooking = null;
    //     },

    //     async confirmDelete() {
    //         if (!this.selectedBooking) return;
            
    //         try {
    //             this.isLoading = true;
    //             const response = await fetch(`http://localhost:8080/booking/delete?id=${this.selectedBooking.id}`, {
    //                 method: "DELETE",
    //             });
                
    //             if (!response.ok) {
    //                 throw new Error('Failed to delete booking');
    //             }

    //             // Remove from local state
    //             const index = this.bookings.findIndex(b => b.id === this.selectedBooking.id);
    //             if (index > -1) {
    //                 this.bookings.splice(index, 1);
    //             }

    //             this.showAlert('Booking berhasil dihapus', 'success');
    //         } catch (error) {
    //             this.showAlert('Gagal menghapus booking', 'error');
    //             console.error("Failed to delete booking:", error);
    //         } finally {
    //             this.isLoading = false;
    //             this.showDeleteModal = false;
    //             this.selectedBooking = null;
    //         }
    //     },

    //     showAlert(message, type = 'success') {
    //         this.alertMessage = message;
    //         this.alertType = type;
    //         setTimeout(() => {
    //             this.alertMessage = '';
    //         }, 3000);
    //     },

    //     async deleteBooking(id) {
    //         try {
    //             const response = await fetch(`http://localhost:8080/booking/delete?id=${id}`, {
    //                 method: "DELETE",
    //             });
    //             if (!response.ok) {
    //                 throw new Error("Failed to delete booking");
    //             }
    //             this.fetchBookings(); // Refresh list after deletion
    //         } catch (error) {
    //             console.error("Failed to delete booking:", error);
    //         }
    //     },

    //     deletePerson(person) {
    //         const index = this.tableData.indexOf(person)
    //         if (index > -1) {
    //             this.tableData.splice(index, 1)
    //         }
    //     }
    // },

    mounted() {
        this.fetchBookings();
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000, // Durasi animasi dalam milidetik
            distance: '60px', // Jarak elemen akan muncul
            delay: 300, // Jeda antara setiap animasi
            reset: false, // Jika false, animasi tidak akan dijalankan lagi setiap kali elemen terlihat
        });
        ScrollReveal().reveal('.s-l', { delay: 300, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 600, origin: 'right' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
    }
}
</script>

<style scoped>
.modal-enter-active,
.modal-leave-active {
    transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
    opacity: 0;
}
</style>