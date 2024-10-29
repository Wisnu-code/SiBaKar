<template>
    <div class="">
        <div
            class="md:m-20 mt-20 flex flex-col items-center rounded-lg shadow bg-primary md:flex-row max-w-full md:min-h-96 overflow-hidden">

            <div class="flex flex-col justify-between items-center md:h-auto p-4 leading-normal w-full">

                <div class="md:ml-12 max-w-full h-auto flex justify-between flex-col">

                    <!-- Text Content -->
                    <h5 class="s-l mb-2 text-4xl md:text-6xl text-justify font-extrabold tracking-tight text-white">Atur
                        dan pesan tempat kerja anda dengan mudah.</h5>

                    <!-- Button -->
                    <!-- Tombol Berdasarkan Status Login -->
                    <router-link v-if="isLoggedIn" to="/service"
                        class="s-b shadow-md bg-button max-w-full md:w-3/12 w-full rounded-xl pl-10 p-2 mt-14">
                        <button type="button" class="learn-more">
                            <span class="circle" aria-hidden="true">
                                <span class="icon arrow"></span>
                            </span>
                            <span class="button-text">Layanan</span>
                        </button>
                    </router-link>
                    <router-link v-else to="/login"
                        class="s-b shadow-md bg-button max-w-full md:w-3/12 w-full rounded-xl pl-10 p-2 mt-14">
                        <button type="button" class="learn-more">
                            <span class="circle" aria-hidden="true">
                                <span class="icon arrow"></span>
                            </span>
                            <span class="button-text">Masuk</span>
                        </button>
                    </router-link>

                </div>

            </div>

            <!-- Img -->
            <div class="s-r flex max-h-full pr-10 mt-10">
                <img class="object-cover w-full h-auto rounded-t-lg md:mr-10 md:w-fit md:rounded-none md:rounded-s-lg"
                    src="../assets/undraw_favourite_item_pcyo1.png" alt="">
            </div>
        </div>

        <!-- Tampilan Jumlah -->
        <div
            class="s-b mt-20 md:mt-24 max-w-full h-auto p-4 text-center bg-secondary  border rounded-lg shadow sm:p-8 md:mx-20">
            <div class="flex items-center justify-evenly md:gap-10 md:flex-row flex-col">
                <div class="s-b-5 mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class=" md:text-3xl text-2xl font-bold text-white ">Seat</div>
                </div>
                <div class="s-b-6 mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class=" md:text-3xl text-2xl font-bold text-white ">Floor</div>
                </div>
                <div class="s-b-7 mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class=" md:text-3xl text-2xl font-bold text-white ">Person</div>
                </div>
            </div>
        </div>

    </div>
</template>

<script setup>
// Import ScrollReveal
import ScrollReveal from 'scrollreveal';
</script>

<script>
export default {
    name: 'HomeComponents',
    data() {
        return {
            isLoggedIn: !!localStorage.getItem('token'), // Status login
        }
    },
    methods: {
        checkLoginStatus() {
            this.isLoggedIn = !!localStorage.getItem('token'); // Update login status
        },
    },
    mounted() {
        window.addEventListener('storage', this.checkLoginStatus); // Pantau perubahan di localStorage
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000, // Durasi animasi dalam milidetik
            distance: '60px', // Jarak elemen akan muncul
            delay: 300, // Jeda antara setiap animasi
            reset: true, // Jika true, animasi akan dijalankan lagi setiap kali elemen terlihat
        });
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 100, origin: 'right' });
        ScrollReveal().reveal('.s-t', { delay: 100, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-5', { delay: 500, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-6', { delay: 600, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-7', { delay: 700, origin: 'bottom' });
        ScrollReveal().reveal('.intern div, .inter a', { delay: 50, origin: 'bottom', interval: 50 });
        ScrollReveal().reveal('.r .r-delay', { delay: 300, origin: 'right', interval: 100 });
    },
    beforeUnmount() {
        window.removeEventListener('storage', this.checkLoginStatus);
    },
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
    left: 0;
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