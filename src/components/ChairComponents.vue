<template>
    <div>
        <!-- Modal Trigger -->
        <div class="s-b flex justify-center items-center">
            <button @click="showModal = true" class="md:hidden mt-12 bg-blue-500 text-white p-2 rounded text-lg">Mulai
                Pesan</button>
        </div>

        <!-- Desktop layout -->
        <div v-if="!isMobileView"
            class="s-b mt-20 md:mt-24 max-w-full h-screen p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">
            <!-- Content layout here (unchanged) -->
            <div class="h-[95%] rounded-xl overflow-auto">
                <div class="grid-container grid grid-cols-[repeat(9,_1fr)] gap-2 p-4">
                    <div v-for="bangku in bangkus" :key="bangku.id" :class="[ 
                        bangku.status === 'occupied' ? 'bg-red-500' : 'bg-green-500', 
                        'grid-item', 'rounded-lg', 'p-4', 'text-center', 'cursor-pointer'
                    ]" @click="bookSeat(bangku)">
                        Bangku {{ bangku.id }} - Status: {{ bangku.status === 'occupied' ? 'Terisi' : 'Tersedia' }}
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile Modal Layout -->
        <div v-if="isMobileView && showModal"
            class="fixed w-full inset-0 bg-black bg-opacity-50 backdrop-blur-sm flex justify-center items-center z-50">
            <button @click="showModal = false"
                class="s-r absolute top-2 right-2 bg-red-500 text-white rounded-full p-2">X</button>
            <div class="relative bg-white p-4 h-full overflow-auto zoom-container">

                <div class="mt-5 bro">
                    <div class="s-b mt-44 h-auto p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">
                        <div class="h-[95%] rounded-xl overflow-auto">
                            <div class="grid-container grid grid-cols-[repeat(9,_1fr)] gap-2 p-4">
                                <div v-for="bangku in bangkus" :key="bangku.id" :class="[ 
                                    bangku.status === 'occupied' ? 'bg-red-500' : 'bg-green-500', 
                                    'grid-item', 'rounded-lg', 'p-4', 'text-center', 'cursor-pointer'
                                ]" @click="bookSeat(bangku)">
                                    Bangku {{ bangku.id }} - Status: {{ bangku.status === 'occupied' ? 'Terisi' : 'Tersedia' }}
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-col md:flex-row md:mx-0 mx-10 text-justify mt-5 gap-3 mb-10 justify-around">
                            <div class="flex flex-row w-full gap-3">
                                <h1 class="s-l-2 bg-primary shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                <h1 class="s-b w-full h-full text-lg">ini adalah kode warna yang bangkunya masih kosong
                                </h1>
                            </div>
                            <div class="flex flex-row w-full gap-3">
                                <h1 class="s-l-2 bg-secondary shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                <h1 class="s-b w-full h-full text-lg">ini adalah kode warna yang bangkunya masih kosong
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ChairComponents',
    data() {
        return {
            showModal: false,
            isMobileView: false,
            // Bangku awal (150 bangku dengan status "available")
            bangkus: Array.from({ length: 150 }, (v, i) => ({
                id: i + 1,
                status: 'available' // Status awal bangku
            })),
            occupiedSeats: [] // Menyimpan bangku yang terisi
        };
    },
    mounted() {
        this.checkMobileView();
        this.fetchOccupiedSeats(); // Ambil data bangku yang terisi
        window.addEventListener('resize', this.checkMobileView);
    },
    beforeUnmount() {
        window.removeEventListener('resize', this.checkMobileView);
    },
    methods: {
        // Cek apakah tampilan dalam mode mobile
        checkMobileView() {
            this.isMobileView = window.innerWidth < 768; // Threshold untuk tampilan mobile
        },

        // Mengambil data bangku yang terisi dari server
        // Mengambil data bangku yang terisi
        async fetchOccupiedSeats() {
            try {
                const response = await fetch('http://localhost:8080/occupied-seats');

                if (!response.ok) {
                    throw new Error('Response not OK: ' + response.statusText);
                }

                const occupiedSeats = await response.json();

                // Debugging: log data respons
                console.log('Data occupiedSeats:', occupiedSeats);

                // Pastikan data yang diterima berupa array
                if (Array.isArray(occupiedSeats)) {
                    this.occupiedSeats = occupiedSeats.map(seat => seat.toString());  // Konversi ID menjadi string
                    this.updateSeatStatus(); // Update status bangku setelah mendapatkan data
                } else {
                    console.error('Data yang diterima bukan array:', occupiedSeats);
                }
            } catch (error) {
                console.error('Error fetching occupied seats:', error);
            }
        }
        ,

        // Update status bangku berdasarkan data bangku yang terisi
        updateSeatStatus() {
            this.bangkus.forEach(bangku => {
                // Pastikan status bangku sesuai dengan data yang diterima
                if (this.occupiedSeats.includes(bangku.id.toString())) {
                    bangku.status = 'occupied'; // Ganti status menjadi terisi
                } else {
                    bangku.status = 'available'; // Ganti status menjadi tersedia
                }
            });
        },

        // Mengonfirmasi pemesanan bangku yang dipilih
        async bookSeat(bangku) {
            if (!localStorage.getItem('token')) {
                alert('Anda harus login terlebih dahulu!');
                this.$router.push('/login');  // Redirect ke halaman login
                return;
            }
            
            if (bangku.status === 'occupied') {
                alert('Bangku ini sudah terisi. Silakan pilih bangku lain.');
                return;
            }

            const namalengkap = prompt('Masukkan nama lengkap Anda:');
            const namadivisi = prompt('Masukkan nama divisi Anda:');

            if (!namalengkap || !namadivisi) {
                alert('Nama lengkap dan nama divisi harus diisi!');
                return;
            }


            // Kirim data pemesanan ke server
            const bookingData = {
                namalengkap,
                nama_divisi : namadivisi,
                selected_seat: bangku.id.toString(),
                status: 'occupied'  // Kirim status 'occupied' saat pemesanan
            };

            console.log("Data yang dikirim ke backend:", bookingData); 
            try {
                const response = await fetch('http://localhost:8080/booking', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                       
                    },
                    body: JSON.stringify(bookingData)
                });

                if (!response.ok) {
                    throw new Error('Booking failed');
                }

                const result = await response.json();
                console.log(result);
                alert(`Pemesanan berhasil untuk ${result.namalengkap} dari ${result.nama_divisi} untuk bangku ${result.selected_seat}`);

                // Update status bangku setelah pemesanan berhasil
                bangku.status = 'occupied'; // Mengupdate status pada frontend juga
            } catch (error) {
                console.error('Booking error:', error);
                alert('Pemesanan gagal. Silakan coba lagi.');
            }
        }
    }
};
</script>


<style scoped>
/* Basic modal styles */
.fixed {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* and Scroll container */
.zoom-container {
    overflow: auto;
    touch-action: none;
}

.zoom-container:active {
    cursor: grab;
}

/* Optional: handling for mobile */
.zoom-container img {
    transition: transform 0.25s ease;
}

@media (max-width: 768px) {

    /* Adjust layout for mobile modal */
    .zoom-container {
        width: 100%;
        max-height: 80vh;
        overflow-x: scroll;
    }

    .bro {
        width: 35rem;
    }
}
</style>