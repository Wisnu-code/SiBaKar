<template>
    <div>
        <!-- Modal Trigger -->
        <div class="flex justify-center items-center">
            <button @click="showModal = true" class="md:hidden mt-10 bg-blue-500 text-white p-2 rounded">Mulai Pesan</button>
        </div>

        <!-- Desktop layout -->
        <div v-if="!isMobileView"
            class="mt-20 max-w-full h-auto p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">
            <!-- Content layout here (unchanged) -->
            <!-- Your grid layout code -->
            <div class="grid justify-items-stretch grid-cols-9 grid-rows-6 md:gap-5 gap-3 pb-5">
                <div class="col-span-7 col-start-2 bg-gray-900 rounded-lg h-7"></div>
                <div class="row-span-6 row-start-2 bg-pilar rounded-lg justify-self-start w-7"></div>
                <div class="row-span-6 col-start-9 row-start-2 bg-pilar rounded-lg justify-self-end w-7"></div>
                <div class="col-start-2 row-start-3 rounded-lg row-span-4">
                    <div class="w-full h-full flex flex-col justify-evenly items-center gap-5 py-10">
                        <div class="bg-primary md:h-full h-8 w-full rounded-lg">1</div>
                        <div class="bg-secondary md:h-full h-8 w-full rounded-lg">2</div>
                        <div class="bg-primary md:h-full h-8 w-full rounded-lg">3</div>
                    </div>
                </div>
                <div class="col-start-3 row-start-3 bg-secondary rounded-lg h-10 md:h-20">4</div>
                <div class="col-start-3 row-start-4 bg-primary rounded-lg h-10 md:h-20">5</div>
                <div class="col-start-3 row-start-5 bg-primary rounded-lg h-10 md:h-20">6</div>
                <div class="col-start-3 row-start-6 bg-secondary rounded-lg h-10 md:h-20">7</div>
                <div class="col-start-4 row-start-3 bg-secondary rounded-lg h-10 md:h-20">8</div>
                <div class="col-start-4 row-start-4 bg-primary rounded-lg h-10 md:h-20">9</div>
                <div class="col-start-4 row-start-5 bg-primary rounded-lg h-10 md:h-20">10</div>
                <div class="col-start-4 row-start-6 bg-secondary rounded-lg h-10 md:h-20">11</div>
                <div class="col-start-5 row-start-3 bg-secondary rounded-lg h-10 md:h-20">12</div>
                <div class="row-span-2 col-start-5 row-start-4 bg-primary rounded-lg h-full"></div>
                <div class="col-start-5 row-start-6 bg-secondary rounded-lg h-10 md:h-20">13</div>
                <div class="col-start-6 row-start-3 bg-secondary rounded-lg h-10 md:h-20">14</div>
                <div class="row-span-2 col-start-6 row-start-4 bg-primary rounded-lg h-full"></div>
                <div class="col-start-6 row-start-6 bg-secondary rounded-lg h-10 md:h-20">15</div>
                <div class="col-start-7 row-start-3 bg-secondary rounded-lg h-10 md:h-20">16</div>
                <div class="col-start-7 row-start-4 bg-primary rounded-lg h-10 md:h-20">17</div>
                <div class="col-start-7 row-start-5 bg-primary rounded-lg h-10 md:h-20">18</div>
                <div class="col-start-7 row-start-6 bg-secondary rounded-lg h-10 md:h-20">19</div>
                <div class="col-start-8 row-start-3 bg-secondary rounded-lg h-10 md:h-20">20</div>
                <div class="col-start-8 row-start-4 bg-primary rounded-lg h-10 md:h-20">21</div>
                <div class="col-start-8 row-start-5 bg-primary rounded-lg h-10 md:h-20">22</div>
                <div class="col-start-8 row-start-6 bg-secondary rounded-lg h-10 md:h-20">23</div>
            </div>
    
            <div class="flex flex-col md:flex-row md:mx-0 mx-10 text-justify mt-5 gap-3 mb-10 justify-around">
                <div class="flex flex-row w-full gap-3">
                    <h1 class="bg-primary max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                    <h1 class="w-full h-full">ini adalah kode warna yang bangkunya masih kosong</h1>
                </div>
                <div class="flex flex-row w-full gap-3">
                    <h1 class="bg-secondary max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                    <h1 class="w-full h-full">ini adalah kode warna yang bangkunya masih kosong</h1>
                </div>
            </div>
        </div>

        <!-- Mobile Modal Layout -->
        <div v-if="isMobileView && showModal"
            class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50">
            <button @click="showModal = false"
                class="absolute top-2 right-2 bg-red-500 text-white rounded-full p-2">X</button>
            <div class="relative bg-white p-4 h-full overflow-auto zoom-container">

                <div class="mt-5 bro">
                    <!-- Content layout that is zoomable and scrollable -->
                        <!-- Same content as desktop layout here -->
                        <!-- Your grid layout code -->
                        <div class="mt-20 max-w-full h-auto p-4 bg-newcolor text-center text-white shadow rounded-lg sm:p-8 md:mx-20">
                            <div class="grid justify-items-stretch grid-cols-9 grid-rows-6 md:gap-5 gap-3 pb-5">
                                <div class="col-span-7 col-start-2 bg-gray-900 rounded-lg h-7"></div>
                                <div class="row-span-6 row-start-2 bg-pilar rounded-lg justify-self-start w-7"></div>
                                <div class="row-span-6 col-start-9 row-start-2 bg-pilar rounded-lg justify-self-end w-7"></div>
                                <div class="col-start-2 row-start-3 rounded-lg row-span-4">
                                    <div class="w-full h-full flex flex-col justify-evenly items-center gap-5 py-10">
                                        <div class="bg-primary md:h-full h-8 w-full rounded-lg">1</div>
                                        <div class="bg-secondary md:h-full h-8 w-full rounded-lg">2</div>
                                        <div class="bg-primary md:h-full h-8 w-full rounded-lg">3</div>
                                    </div>
                                </div>
                                <div class="col-start-3 row-start-3 bg-secondary rounded-lg h-10 md:h-20">4</div>
                                <div class="col-start-3 row-start-4 bg-primary rounded-lg h-10 md:h-20">5</div>
                                <div class="col-start-3 row-start-5 bg-primary rounded-lg h-10 md:h-20">6</div>
                                <div class="col-start-3 row-start-6 bg-secondary rounded-lg h-10 md:h-20">7</div>
                                <div class="col-start-4 row-start-3 bg-secondary rounded-lg h-10 md:h-20">8</div>
                                <div class="col-start-4 row-start-4 bg-primary rounded-lg h-10 md:h-20">9</div>
                                <div class="col-start-4 row-start-5 bg-primary rounded-lg h-10 md:h-20">10</div>
                                <div class="col-start-4 row-start-6 bg-secondary rounded-lg h-10 md:h-20">11</div>
                                <div class="col-start-5 row-start-3 bg-secondary rounded-lg h-10 md:h-20">12</div>
                                <div class="row-span-2 col-start-5 row-start-4 bg-primary rounded-lg h-full"></div>
                                <div class="col-start-5 row-start-6 bg-secondary rounded-lg h-10 md:h-20">13</div>
                                <div class="col-start-6 row-start-3 bg-secondary rounded-lg h-10 md:h-20">14</div>
                                <div class="row-span-2 col-start-6 row-start-4 bg-primary rounded-lg h-full"></div>
                                <div class="col-start-6 row-start-6 bg-secondary rounded-lg h-10 md:h-20">15</div>
                                <div class="col-start-7 row-start-3 bg-secondary rounded-lg h-10 md:h-20">16</div>
                                <div class="col-start-7 row-start-4 bg-primary rounded-lg h-10 md:h-20">17</div>
                                <div class="col-start-7 row-start-5 bg-primary rounded-lg h-10 md:h-20">18</div>
                                <div class="col-start-7 row-start-6 bg-secondary rounded-lg h-10 md:h-20">19</div>
                                <div class="col-start-8 row-start-3 bg-secondary rounded-lg h-10 md:h-20">20</div>
                                <div class="col-start-8 row-start-4 bg-primary rounded-lg h-10 md:h-20">21</div>
                                <div class="col-start-8 row-start-5 bg-primary rounded-lg h-10 md:h-20">22</div>
                                <div class="col-start-8 row-start-6 bg-secondary rounded-lg h-10 md:h-20">23</div>
                            </div>
                    
                            <div class="flex flex-col md:flex-row md:mx-0 mx-10 text-justify mt-5 gap-3 mb-10 justify-around">
                                <div class="flex flex-row w-full gap-3">
                                    <h1 class="bg-primary max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                    <h1 class="w-full h-full">ini adalah kode warna yang bangkunya masih kosong</h1>
                                </div>
                                <div class="flex flex-row w-full gap-3">
                                    <h1 class="bg-secondary max-w-full w-10 md:w-14 h-auto rounded-sm"></h1>
                                    <h1 class="w-full h-full">ini adalah kode warna yang bangkunya masih kosong</h1>
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
            isMobileView: false
        };
    },
    mounted() {
        this.checkMobileView();
        window.addEventListener('resize', this.checkMobileView);
    },
    beforeUnmount() {
        window.removeEventListener('resize', this.checkMobileView);
    },
    methods: {
        checkMobileView() {
            this.isMobileView = window.innerWidth < 768; // Threshold for mobile view
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

/* Zoom and Scroll container */
.zoom-container {
    overflow: auto;
    touch-action: none;
}

.zoom-container:active {
    cursor: grab;
}

/* Optional: Zoom handling for mobile */
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
