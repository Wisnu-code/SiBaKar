<template>
    <div>
        <!-- Modal Trigger -->
        <div class="s-b flex justify-center items-center">
            <button @click="showModal = true" class="md:hidden mt-12 bg-blue-500 text-white p-2 rounded text-lg">Mulai
                Pesan</button>
        </div>

        <!-- Desktop layout -->
        <div v-if="!isMobileView"
            class="s-b-5 mt-20 md:mt-24 max-w-full h-screen p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">
            <!-- Content layout here (unchanged) -->
            <!-- Your grid layout code -->
            <div class="h-[95%] rounded-xl overflow-auto">
                <div class="grid-container grid grid-cols-[repeat(9,_1fr)] gap-2 p-4">
                    <div v-for="bangku in bangkus" :key="bangku.id"
                        :class="bangku.status === 'occupied' ? 'bg-red-500' : 'bg-primary'"
                        class="grid-item rounded-lg p-4 text-center">
                        Bangku {{ bangku.id }} - Status: {{ bangku.status === 'occupied' ? 'Terisi' :
                            'Tersedia' }}
                    </div>
                </div>
            </div>

            <div class="flex flex-col md:flex-row md:mx-0 mx-10 text-justify mt-5 gap-3 mb-10 justify-around">
                <div class="flex flex-row w-full gap-3">
                    <h1 class="bg-primary s-b-5 shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                    <h1 class="s-b-5 w-full h-full text-xl">ini adalah kode warna yang bangkunya masih kosong</h1>
                </div>
                <div class="flex flex-row w-full gap-3 zoom">
                    <h1 class="bg-secondary s-b-5 shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                    <h1 class="s-b-5 w-full h-full text-xl">ini adalah kode warna yang bangkunya masih kosong</h1>
                </div>
            </div>
        </div>

        <!-- Mobile Modal Layout -->
        <div v-if="isMobileView && showModal"
            class="fixed w-full inset-0 bg-black bg-opacity-50 backdrop-blur-sm flex justify-center items-center z-50">
            <button @click="showModal = false"
                class="absolute top-2 right-2 bg-red-500 text-white rounded-full p-2">X</button>
            <div class="relative bg-white p-4 h-full overflow-auto zoom-container">

                <div class="mt-5 bro">
                    <!-- Content layout that is zoomable and scrollable -->
                    <!-- Same content as desktop layout here -->
                    <!-- Your grid layout code -->
                    <div class="mt-44 h-auto p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">


                        <div class="h-[95%] rounded-xl overflow-auto">
                            <div class="grid-container grid grid-cols-[repeat(9,_1fr)] gap-2 p-4">
                                <div v-for="bangku in bangkus" :key="bangku.id"
                                    :class="bangku.status === 'occupied' ? 'bg-red-500' : 'bg-primary'"
                                    class="grid-item rounded-lg p-4 text-center">
                                    Bangku {{ bangku.id }} - Status: {{ bangku.status === 'occupied' ? 'Terisi' :
                                    'Tersedia' }}
                                </div>
                            </div>
                        </div>
                        <div
                            class="flex flex-col md:flex-row md:mx-0 mx-10 text-justify mt-5 gap-3 mb-10 justify-around">
                            <div class="flex flex-row w-full gap-3">
                                <h1 class="bg-primary shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                <h1 class="w-full h-full text-lg">ini adalah kode warna yang bangkunya masih kosong</h1>
                            </div>
                            <div class="flex flex-row w-full gap-3">
                                <h1 class="bg-secondary shadow-xl max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                <h1 class="w-full h-full text-lg">ini adalah kode warna yang bangkunya masih kosong</h1>
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
            bangkus: Array.from({ length: 150 }, (v, i) => ({
                id: i + 1,
                status: 'available' // Status awal
            })),
            occupiedSeats: [] // Menyimpan bangku terisi
        };
    },
    mounted() {
        this.checkMobileView();
        this.fetchOccupiedSeats(); // Ambil data bangku terisi
        window.addEventListener('resize', this.checkMobileView);
    },
    beforeUnmount() {
        window.removeEventListener('resize', this.checkMobileView);
    },
    methods: {
        checkMobileView() {
            this.isMobileView = window.innerWidth < 768; // Threshold untuk tampilan mobile
        },
        async fetchOccupiedSeats() {
            try {
                const response = await fetch('http://localhost:8080/occupied-seats');
                if (!response.ok) {
                    throw new Error('Response not OK: ' + response.statusText);
                }
                this.occupiedSeats = await response.json();
                this.updateSeatStatus(); // Update status bangku setelah mendapatkan data
            } catch (error) {
                console.error('Error fetching occupied seats:', error);
            }
        },
        updateSeatStatus() {
            this.bangkus.forEach(bangku => {
                if (this.occupiedSeats.includes(bangku.id.toString())) {
                    bangku.status = 'occupied'; // Ganti status menjadi terisi
                }
            });
        }
    }
}
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