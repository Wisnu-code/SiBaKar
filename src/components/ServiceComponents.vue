<template>
    <div class="overflow-hidden">
        <div class="flex flex-col md:flex-row md:mx-0 mx-5 text-justify mt-24">

            <div class="relative max-w-full h-full md:m-20 mb-0">
                <div
                    class="s-b-4 shadow-lg md:ml-36 relative w-full md:w-72 md:h-80 h-64 bg-gray-200 rounded-lg overflow-hidden">

                    <div
                        class="absolute top-0 left-0 w-16 h-16 bg-white rounded-br-3xl flex items-center justify-center">
                        <!-- Jika showVideo false, tampilkan tombol Play -->
                        <div v-if="!showVideo"
                            class="absolute top-0 left-0 w-full h-full flex items-center justify-center bg-white ">
                            <!-- Tombol Play -->
                            <div @click="playVideo"
                                class="w-16 h-16 bg-white rounded-full flex items-center justify-center cursor-pointer">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 text-gray-700" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M14.752 11.168l-5.197-3.722A1 1 0 008 8.198v7.605a1 1 0 001.555.832l5.197-3.722a1 1 0 000-1.664z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Jika showVideo true, tampilkan iframe YouTube -->
                    <iframe v-if="showVideo" width="100%" height="100%" class="shadow-lg" :src="videoUrl"
                        title="YouTube Video" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                    </iframe>
                </div>

                <!-- Teks Waktu Video -->
                <div class="s-l-2 absolute top-0 md:left-0 left-20 md:ml-5">
                    <span class="text-xl font-medium text-gray-700">Lihat Video<br></span>
                </div>
            </div>

            <div class="md:mt-20 mt-10 max-w-full md:w-2/4 md:mr-20">
                <div class="s-t-5 md:text-3xl w-full text-lg font-medium text-gray-600">Kami memahami bahwa setiap
                    perusahaan memiliki
                    kebutuhan unik dalam menciptakan lingkungan kerja yang optimal. Oleh karena itu, kami menyediakan
                    berbagai layanan yang dirancang khusus untuk mendukung efisiensi, fleksibilitas, dan kenyamanan
                    dalam pengelolaan ruang kerja Anda.</div>

                <div class="s-r shadow-md bg-button max-w-full md:w-2/5 w-full rounded-xl pl-10 p-2 mt-5 md:mt-14">
                    <button @click="showAlert = true" type="button" class="learn-more">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                        <span class="button-text">Mulai Reservasi</span>
                    </button>
                </div>
            </div>
        </div>

        <ChairComponents />

        <!-- Alert Form -->
        <div v-if="showAlert"
            class="s-b fixed backdrop-blur-md inset-0 bg-gray-900 bg-opacity-50 flex justify-center items-center z-50">
            <div class="bg-white rounded-lg p-8 w-96 md:w-[40%]">
                <h2 class="text-3xl md:text-5xl font-semibold mb-4 text-center">Booking Form</h2>
                <form @submit.prevent="handleBooking">
                    <!-- Nama Lengkap Input -->
                    <div class="mb-4">
                        <label for="namalengkap" class="block text-xl md:text-2xl text-gray-600">Nama Lengkap</label>
                        <input type="text" id="namalengkap" v-model="namalengkap"
                            class="block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                    </div>
                    <!-- Divisi/Tim Input -->
                    <div class="mb-4">
                        <label for="namadivisi" class="block text-xl md:text-2xl text-gray-600">Divisi/Tim</label>
                        <input type="text" id="namadivisi" v-model="namadivisi"
                            class="block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                    </div>
                    <!-- Dropdown for Seats Selection -->
                    <div class="mb-4">
                        <label for="service" class="block text-xl md:text-2xl text-gray-600">Silahkan pilih bangku yang
                            tersisa</label>
                        <select id="service" v-model="selectedSeat"
                            class="block text-xl md:text-2xl py-2.5 px-0 w-full text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            required>
                            <option disabled value="" class="text-xl md:text-2xl">Silahkan pilih satu</option>
                            <option v-for="seat in availableSeats" :key="seat.id" :value="seat.id">{{ seat.name }}
                            </option>
                        </select>
                    </div>
                    <!-- Booking Button -->
                    <div class="text-center text-xl md:text-2xl md:flex md:flex-col md:justify-center md:items-center">
                        <button type="submit"
                            class="group relative w-full min-h-[50px] md:w-[50%] rounded-md  overflow-hidden border border-red-500 bg-white text-red-500 shadow-lg transition-all before:absolute before:left-0 before:top-0 before:h-0 before:w-[51%] before:bg-blue-600 before:duration-500 after:absolute after:bottom-0 after:right-0 after:h-0 after:w-[50%] after:bg-blue-600 after:duration-500 hover:text-white hover:before:h-full hover:after:h-full">
                            <span
                                class="absolute bottom-0 font-semibold left-0 right-0 top-0 z-10 flex h-full w-full items-center justify-center group-hover:text-white">Kirim</span>
                        </button>
                        <button @click="closeAlert" type="button"
                            class="group mt-2 relative w-full min-h-[50px] md:w-[50%] rounded-md  overflow-hidden border border-gray-500 bg-white text-gray-500 shadow-lg transition-all before:absolute before:right-0 before:top-0 before:h-0 before:w-[50%] before:bg-gray-600 before:duration-500 after:absolute after:bottom-0 after:left-0 after:h-0 after:w-[51%] after:bg-gray-600 after:duration-500 hover:text-white hover:before:h-full hover:after:h-full">
                            <span
                                class="absolute bottom-0 font-semibold left-0 right-0 top-0 z-10 flex h-full w-full items-center justify-center group-hover:text-white">Batal</span>
                        </button>
                        <!-- <button type="submit"
                            class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full md:w-[50%]">Submit</button> -->
                        <!-- <button @click="closeAlert" type="button"
                            class="bg-gray-500 hover:bg-gray-600 text-white font-semibold rounded-md py-2 px-4 mt-2 w-full md:w-[50%]">Cancel</button> -->
                    </div>
                </form>
            </div>
        </div>

        <div class="mt-20 max-w-full h-auto p-4 text-center bg-white rounded-lg sm:p-8">
            <div class="in flex items-center justify-between md:gap-10 md:flex-row flex-col md:mx-20">
                <div class="in-1 zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="in-2 zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem,
                        ipsum.</div>
                </div>
                <div class="in-1 zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="in-2 zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem,
                        ipsum.</div>
                </div>
                <div class="in-1 zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="in-2 zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem,
                        ipsum.</div>
                </div>
            </div>
        </div>

        <div class="s-l zoom my-10 text-4xl md:text-5xl font-bold text-center text-gray-800">
            Cara Kerja
        </div>

        <div class="s-t zoom bg-white dark:bg-gray-800 flex justify-center items-center w-full h-full p-5">
            <div class="border shadow-lg max-w-2xl p-6 rounded-lg dark:bg-gray-700 dark:text-gray-300">
                <div class="w-full max-w-screen-xl px-10 mx-auto">
                    <ul class="in flex-col md:flex-row flex md:space-x-8 mt-4 md:mt-0 text-2xl font-bold">

                        <li>
                            <a href="#"
                                class="in-2 zoom zoomS text-gray-400 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-blue-700 md:p-0 dark:text-white dark:hover:text-gray-700 dark:md:hover:text-blue-700"
                                @click.prevent="toggleMain">
                                Utama
                            </a>
                        </li>

                        <li>
                            <a href="#"
                                class="in-2 zoom zoomS text-gray-400 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-blue-700 md:p-0 dark:text-white dark:hover:text-gray-700 dark:md:hover:text-blue-700"
                                @click.prevent="toggleEvent">
                                Event
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="s-b-4 w-full md:px-20 mt-10 text-center">

            <!-- saat link utama ditekan akan muncul, namun akan hilang saat link event ditekan -->
            <div v-if="showMain" class="intern grid md:grid-cols-3 grid-rows-1 gap-14">
                <div class="sla zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="sla zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="sla zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
            </div>

            <!-- saat link event ditekan akan muncul, namun akan hilang saat link utama ditekan -->
            <div v-if="showEvent" class="intern grid md:grid-cols-3 grid-rows-1 gap-14">
                <div class="sla zoom zoomS bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="sla zoom zoomS bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="sla zoom zoomS bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="slb zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur
                        adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import ChairComponents from './ChairComponents.vue';
</script>

<script>
import ScrollReveal from 'scrollreveal';

export default {
    name: 'ServiceComponents',
    mounted() {
        ScrollReveal({
            duration: 1000,
            distance: '60px',
            delay: 300,
            reset: true,
        });
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-l-2', { delay: 200, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 100, origin: 'right' });
        ScrollReveal().reveal('.s-r-3', { delay: 300, origin: 'right' });
        ScrollReveal().reveal('.s-t', { delay: 100, origin: 'top' });
        ScrollReveal().reveal('.s-t-5', { delay: 500, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-4', { delay: 400, origin: 'bottom' });
        ScrollReveal().reveal('.in .in-1', { delay: 300, origin: 'bottom', interval: 200 })
        ScrollReveal().reveal('.in .in-2', { delay: 500, origin: 'right', interval: 200 })
    },
    data() {
        return {
            showMain: true,
            showEvent: false,
            showVideo: false,
            videoUrl: '',
            showAlert: false,
            namalengkap: '',
            namadivisi: '',
            selectedSeat: '',
            availableSeats: Array.from({ length: 150 }, (v, i) => ({
                id: i + 1,
                name: ` ${i + 1}`
            })),
        };
    },
    methods: {
        playVideo() {
            this.videoUrl = 'https://www.youtube.com/embed/_DKnmKFSxS8?autoplay=1';
            this.showVideo = true;
        },
        toggleMain() {
            this.showMain = true;
            this.showEvent = false;
        },
        toggleEvent() {
            this.showMain = false;
            this.showEvent = true;
        },
        async handleBooking() {
            try {
                const response = await fetch('http://localhost:8080/booking', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        namalengkap: this.namalengkap,
                        namadivisi: this.namadivisi,
                        selectedSeat: this.selectedSeat,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data = await response.json();
                alert(`Booking confirmed for ${data.namalengkap} from ${data.namadivisi} for seat ${data.selectedSeat}`);
                this.closeAlert();
            } catch (error) {
                console.error('Error during booking:', error);
                alert('Failed to confirm booking. Please try again.');
            }
        },
        async submitBooking() {
            const bookingData = {
                namalengkap: this.namalengkap,
                namadivisi: this.namadivisi,
                selectedSeat: this.selectedSeat,
            };
            try {
                await fetch("http://localhost:8080/booking", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify(bookingData),
                });
                this.$emit("bookingSubmitted"); // Emit event jika ingin merefresh data pada DashboardChairComponents
            } catch (error) {
                console.error("Failed to submit booking:", error);
            }
        },
        closeAlert() {
            this.showAlert = false;
            this.namalengkap = '';
            this.namadivisi = '';
            this.selectedSeat = '';
        }
    }
}
</script>


<style scoped>
button {
    position: relative;
    display: inline-block;
    cursor: pointer;
    outline: none;
    border: 0;
    vertical-align: middle;
    text-decoration: none;
    padding: 0;
    font-size: inherit;
    font-family: inherit;
}

button.learn-more {
    width: 12rem;
    height: auto;
}

button.learn-more .circle {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: relative;
    display: block;
    margin: 0;
    width: 3rem;
    height: 3rem;
    background: white;
    border-radius: 1.625rem;
}

button.learn-more .circle .icon {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    background: black;
}

button.learn-more .circle .icon.arrow {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    left: 0.625rem;
    width: 1.125rem;
    height: 0.125rem;
    background: none;
}

button.learn-more .circle .icon.arrow::before {
    position: absolute;
    content: "";
    top: -0.29rem;
    right: 0.0625rem;
    width: 0.625rem;
    height: 0.625rem;
    border-top: 0.125rem solid black;
    border-right: 0.125rem solid black;
    transform: rotate(45deg);
}

button.learn-more .button-text {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    left: 10;
    right: 0;
    bottom: 0;
    padding: 0.75rem 0;
    margin: 0 0 0 1.85rem;
    color: white;
    font-weight: 700;
    line-height: 1.6;
    text-align: center;
    text-transform: uppercase;
}

button:hover .circle {
    width: 100%;
    z-index: 10;
}

button:hover .circle .icon.arrow {
    background: black;
    transform: translate(1rem, 0);
}

button:hover .button-text {
    opacity: 0;
    transition: 0.5s;
}

body {
    background-color: black;
}
</style>