<template>
    <div>
        <div class="blockT flex flex-col md:flex-row md:mx-0 mx-5 text-justify mt-24">

            <div class="relative max-w-full h-full md:m-20 mb-0">
                <div class="md:ml-36 relative w-full md:w-72 md:h-80  h-64 bg-gray-200 rounded-lg overflow-hidden">
                    <!-- Bagian atas dengan sudut tanpa lengkungan -->
                    <div
                        class="absolute top-0 left-0 w-16 h-16 bg-white rounded-br-3xl flex items-center justify-center">
                        <!-- Tombol Play -->
                        <div class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center">
                            <!-- Ikon Play -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-white" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M14.752 11.168l-5.197-3.722A1 1 0 008 8.198v7.605a1 1 0 001.555.832l5.197-3.722a1 1 0 000-1.664z" />
                            </svg>
                        </div>
                    </div>

                    <!-- Teks Waktu Video -->
                </div>
                <div class="absolute top-0 md:left-0 left-20 md:ml-5">
                    <span class="text-xl font-medium text-gray-700">Lihat Video<br>2:00 Minutes</span>
                </div>
            </div>

            <div class="md:mt-20 mt-10 max-w-full md:w-2/4 md:mr-20">
                <div class="md:text-5xl w-full text-2xl font-bold">Lorem ipsum dolor sit amet, consectetur adipisicing
                    elit. Beatae, repudiandae.</div>

                <div class="bg-button max-w-full md:w-2/5 w-full rounded-xl pl-10 p-2 mt-5 md:mt-14">
                    <button type="button" class="learn-more">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                        <span class="button-text">Mulai Reservasi</span>
                    </button>
                </div>
            </div>

        </div>

        <ChairComponents />

        <div class="mt-5 md:mt-16 max-w-full h-auto p-4 text-center bg-white rounded-lg sm:p-8">
            <div class="flex items-center justify-between md:gap-10 md:flex-row flex-col md:mx-20">
                <div class="zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem, ipsum.</div>
                </div>
                <div class="zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem, ipsum.</div>
                </div>
                <div class="zoom zoomS mb-3 text-5xl md:text-8xl font-bold text-gray-800 dark:text-white">
                    500 +
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Lorem, ipsum.</div>
                </div>
            </div>
        </div>

        <div class="zoom my-10 text-4xl md:text-5xl font-bold text-center text-gray-800">
            Cara Kerja
        </div>

        <div class="zoom bg-white dark:bg-gray-800 flex justify-center items-center w-full h-full p-5">
            <div class="border shadow-lg max-w-2xl p-6 rounded-lg dark:bg-gray-700 dark:text-gray-300">
                <div class="w-full max-w-screen-xl px-10 mx-auto">
                    <ul class="flex-col md:flex-row flex md:space-x-8 mt-4 md:mt-0 text-2xl font-bold">

                        <li>
                            <a href="#"
                                class="zoom zoomS text-gray-400 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-blue-700 md:p-0 dark:text-white dark:hover:text-gray-700 dark:md:hover:text-blue-700"
                                @click.prevent="toggleMain">
                                Utama
                            </a>
                        </li>

                        <li>
                            <a href="#"
                                class="zoom zoomS text-gray-400 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-blue-700 md:p-0 dark:text-white dark:hover:text-gray-700 dark:md:hover:text-blue-700"
                                @click.prevent="toggleEvent">
                                Event
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="w-full md:px-20 mt-10 text-center">

            <!-- saat link utama ditekan akan muncul, namun akan hilang saat link event ditekan -->
            <div v-if="showMain" class="grid md:grid-cols-3 grid-rows-1 gap-14">
                <div class="zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="zoom zoomS bg-gray-100 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom zoomS text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
            </div>

            <!-- saat link event ditekan akan muncul, namun akan hilang saat link utama ditekan -->
            <div v-if="showEvent" class="grid md:grid-cols-3 grid-rows-1 gap-14">
                <div class="zoom bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="zoom bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
                <div class="zoom bg-gray-300 rounded-xl text-xl font-semibold text-left p-5">Lorem, ipsum.
                    <div class="zoom text-lg font-light text-justify">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Ex repellendus inventore nulla repellat provident quisquam libero earum facilis quibusdam
                        recusandae?</div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    name: 'ServiceComponents',
    data() {
        return {
            showMain: true, // awalnya konten main yang muncul
            showEvent: false
        };
    },
    methods: {
        toggleMain() {
            this.showMain = true;
            this.showEvent = false;
        },
        toggleEvent() {
            this.showMain = false;
            this.showEvent = true;
        }
    }
}
</script>

<script setup>
import gambarSatu from '../assets/icons8-file.svg'
import ChairComponents from './ChairComponents.vue';
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
    background: transparent;
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