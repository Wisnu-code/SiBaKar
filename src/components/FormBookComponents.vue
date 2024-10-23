<template>

        <!-- Alert Form -->
        <div v-if="showAlert" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex justify-center items-center z-50">
            <div class="bg-white rounded-lg p-8 w-96">
                <h2 class="text-xl font-semibold mb-4 text-center">Booking Form</h2>
                <form @submit.prevent="handleBooking">
                    <!-- Nama Lengkap Input -->
                    <div class="mb-4">
                        <label for="namalengkap" class="block text-gray-600">Nama Lengkap</label>
                        <input type="text" id="namalengkap" v-model="namalengkap"
                            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                    </div>
                    <!-- Divisi/Tim Input -->
                    <div class="mb-4">
                        <label for="namadivisi" class="block text-gray-600">Divisi/Tim</label>
                        <input type="text" id="namadivisi" v-model="namadivisi"
                            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                    </div>
                    <!-- Dropdown for Seats Selection -->
                    <div class="mb-4">
                        <label for="service" class="block text-gray-600">Silahkan pilih bangku yang tersisa</label>
                        <select id="service" v-model="selectedSeat"
                            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                            <option disabled value="">Silahkan pilih satu</option>
                            <option v-for="seat in availableSeats" :key="seat.id" :value="seat.name">{{ seat.name }}</option>
                        </select>
                    </div>
                    <!-- Remember Me Checkbox -->
                    <div class="mb-4 flex items-center">
                        <input type="checkbox" id="remember" name="remember" class="text-red-500">
                        <label for="remember" class="text-green-900 ml-2">Remember Me</label>
                    </div>
                    <!-- Booking Button -->
                    <div class="text-center">
                        <button type="submit" class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full">Submit</button>
                        <button @click="closeAlert" type="button" class="bg-gray-500 hover:bg-gray-600 text-white font-semibold rounded-md py-2 px-4 mt-2 w-full">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
</template>

<script>
export default {
    data() {
        return {
            showAlert: false, // Untuk kontrol tampilan alert
            namalengkap: '',
            namadivisi: '',
            selectedSeat: '',
            availableSeats: [ // Contoh daftar bangku yang tersedia
                { id: 1, name: 'Bangku A1' },
                { id: 2, name: 'Bangku A2' },
                { id: 3, name: 'Bangku B1' },
                { id: 4, name: 'Bangku B2' }
            ]
        };
    },
    methods: {
        handleBooking() {
            // Logika untuk memproses booking
            console.log('Booking Details:', {
                namalengkap: this.namalengkap,
                namadivisi: this.namadivisi,
                selectedSeat: this.selectedSeat
            });

            // Reset form setelah booking
            this.namalengkap = '';
            this.namadivisi = '';
            this.selectedSeat = '';
            this.closeAlert();
        },
        closeAlert() {
            this.showAlert = false;
        }
    }
};
</script>

<style scoped>
/* Tambahkan gaya tambahan di sini jika perlu */
</style>
