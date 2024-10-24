<template>
    <div>
        <div class="blockT flex flex-col md:flex-row md:mx-0 mx-5 text-justify mt-24">

            <div class="relative max-w-full h-full md:m-20 mb-0">
                <div
                    class="shadow-lg slides md:ml-36 relative w-full md:w-72 md:h-80 h-64 bg-gray-200 rounded-lg overflow-hidden">

                    <div
                        class="slides absolute top-0 left-0 w-16 h-16 bg-white rounded-br-3xl flex items-center justify-center">
                        <!-- Jika showVideo false, tampilkan tombol Play -->
                        <div v-if="!showVideo"
                            class="slides absolute top-0 left-0 w-full h-full flex items-center justify-center bg-white ">
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
                    <iframe v-if="showVideo" width="100%" height="100%" class="shadow-lg" :src="videoUrl" title="YouTube Video"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                    </iframe>
                </div>

                <!-- Teks Waktu Video -->
                <div class="slides absolute top-0 md:left-0 left-20 md:ml-5">
                    <span class="text-xl font-medium text-gray-700">Lihat Video<br>2:00 Minutes</span>
                </div>
            </div>

            <div class="slides md:mt-20 mt-10 max-w-full md:w-2/4 md:mr-20">
                <div class="md:text-3xl w-full text-lg font-medium">Kami memahami bahwa setiap perusahaan memiliki
                    kebutuhan unik dalam menciptakan lingkungan kerja yang optimal. Oleh karena itu, kami menyediakan
                    berbagai layanan yang dirancang khusus untuk mendukung efisiensi, fleksibilitas, dan kenyamanan
                    dalam pengelolaan ruang kerja Anda.</div>

                <div class="slides shadow-md bg-button max-w-full md:w-2/5 w-full rounded-xl pl-10 p-2 mt-5 md:mt-14">
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
    </div>
</template>

<script setup>
import ChairComponents from './ChairComponents.vue';
</script>

<script>
export default {
    name: 'ServiceComponents',
    data() {
        return {
            showMain: true, // awalnya konten main yang muncul
            showEvent: false,
            showVideo: false, // Status untuk menampilkan video
            videoUrl: '' // URL YouTube dengan autoplay
        };
    },
    methods: {
        playVideo() {
            // Saat tombol play ditekan, tampilkan iframe dan autoplay video
            this.videoUrl = 'https://www.youtube.com/embed/_DKnmKFSxS8?autoplay=1&si=yHeMhPejXI4QndwD';
            this.showVideo = true;
        },
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