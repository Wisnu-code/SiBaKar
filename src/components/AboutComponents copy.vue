<template>
    <div class="overflow-hidden mt-32">
        <div class="overflow-hidden md:mx-20">
            <div
                class="s-t w-full p-4 text-justify bg-secondary border border-gray-200 rounded-2xl shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">

                <!-- Section 1 -->
                <h5 class="s-l-2 mb-5 md:text-2xl text-xl font-bold text-white dark:text-white max-w-full md:mx-20">
                    Mulailah sekarang dan
                    jadikan tempat kerja Anda lebih teratur, nyaman, dan produktif. Kami siap membantu Anda mewujudkan
                    lingkungan kerja yang mendukung kesuksesan!</h5>
                <div class="relative">
                    <!-- Desktop/tablet view - always show full text -->
                    <p
                        class="s-r-3 mb-5 md:text-2xl text-white text-lg dark:text-gray-400 max-w-full md:mx-20 hidden md:block">
                        {{ fullText }}
                    </p>

                    <!-- Mobile view with toggle -->
                    <div class="md:hidden">
                        <p class="s-r-3 mb-2 text-lg text-white dark:text-gray-400">
                            {{ isExpanded ? fullText : shortText }}
                        </p>
                        <button @click="toggleText" class="text-blue-500 hover:text-blue-600 font-medium">
                            {{ isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya' }}
                        </button>
                    </div>
                </div>
                <!-- <p class="s-r-3 mb-5 md:text-xl text-white text-lg dark:text-gray-400 max-w-full md:mx-20">Kami percaya
                    bahwa
                    lingkungan kerja yang nyaman dan fleksibel adalah kunci untuk mencapai produktivitas maksimal. Kami
                    hadir untuk memberikan solusi modern dalam pengelolaan ruang kerja, dengan sistem booking kursi yang
                    dirancang untuk mendukung cara kerja dinamis di era digital. Mari ciptakan tempat kerja yang lebih
                    efisien, di mana Anda dapat fokus pada yang terpenting—mengejar tujuan dan meraih prestasi. Bersama
                    kami, Anda bisa mengatur ruang kerja sesuai kebutuhan, meningkatkan kolaborasi, dan memaksimalkan
                    kreativitas setiap hari.</p> -->
                <div
                    class="items-center justify-center space-y-4 sm:flex sm:space-y-0 sm:space-x-4 rtl:space-x-reverse w-full">
                    <div
                        class="w-full md:min-h-80 sm:w-autotext-white rounded-lg px-4 py-2.5 basis-1/3 grid content-end">
                        <div class="flex gap-1 in">
                            <div class="flex-1 ox bg-button h-12 in-1"></div>
                            <div class="flex-1 ox bg-button h-12 in-1"></div>
                            <div class="flex-1 ox bg-button h-12 in-1"></div>
                            <div class="flex-1 ox bg-button h-12 in-1"></div>
                            <div class="flex-1 ox bg-button h-12 in-1"></div>
                        </div>
                    </div>
                    <div
                        class="s-b-4 w-full sm:w-auto text-white rounded-lg inline-flex items-center justify-center px-4 py-2.5 basis-1/2">

                        <div class="w-full h-auto md:min-h-80">
                            <img class="w-full h-full" :src="imgUn">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 2 -->
        <div class="mt-20 md:px-20 max-w-full h-auto p-4 text-justify bg-white rounded-lg sm:p-8">
            <div
                class="s-l mb-2 md:mb-5 text-2xl font-bold flex self-start text-gray-500 sm:text-lg dark:text-gray-400 md:ml-20 ml-8">
                Our Mission</div>
            <div class="flex flex-col md:flex-row items-stretch justify-center md:gap-10">
                <div class="self-start h-auto w-full">
                    <h1 class="s-b-4 mb-5 text-xl md:text-3xl font-bold text-gray-600 dark:text-white">Menjadi platform terdepan
                        dalam
                        menghadirkan solusi ruang kerja fleksibel yang efisien, modern, dan mendukung produktivitas
                        optimal bagi perusahaan dan karyawan di seluruh dunia.</h1>
                </div>
                <div class="in h-auto w-full">
                    <div class="relative">
                        <p class="in-1 mb-5 md:text-xl text-gray-600 font-semibold text-lg dark:text-gray-400">{{ fullText1 }}</p>
                        <div class="md:hidden">
                            <p class="s-r-3 mb-2 text-lg text-white">{{ isExpanded ? fullText1 :shortText1 }}</p>
                            <button @click="toggleText" class="text-blue-500 hover:text-blue-600 font-medium">
                                {{ isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya' }}
                            </button>
                        </div>
                        <p class="in-1 mb-5 text-lg text-gray-600 font-semibold md:text-xl dark:text-gray-400">{{ fullText2 }}</p>
                        <div class="md:hidden">
                            <p class="s-r-3 mb-2 text-lg text-white">{{ isExpanded ? fullText1 :shortText2 }}</p>
                            <button @click="toggleText" class="text-blue-500 hover:text-blue-600 font-medium">
                                {{ isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya' }}
                            </button>
                        </div>
                        <p class="in-1 mb-5 text-lg text-gray-600 font-semibold md:text-xl dark:text-gray-400">{{ fullText3 }}</p>
                        <div class="md:hidden">
                            <p class="s-r-3 mb-2 text-lg text-white">{{ isExpanded ? fullText1 :shortText3 }}</p>
                            <button @click="toggleText" class="text-blue-500 hover:text-blue-600 font-medium">
                                {{ isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya' }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 3 -->
        <div class="mt-20 max-w-full h-auto p-4 text-center sm:p-8">
            <div
                class="in flex items-center justify-between md:gap-10 md:flex-row flex-col md:mx-12 bg-secondary py-14 px-7 rounded-xl">
                <div class="in-1 mb-3 text-3xl md:text-5xl font-bold text-gray-100 dark:text-white">
                    Morning Briefing
                    <div class="in-2 md:text-2xl mt-3 text-xl font-semibold text-gray-500 dark:text-white">Selasa &
                        Jumat</div>
                </div>
                <div class="in-1 mb-3 text-3xl md:text-5xl font-bold text-gray-100 dark:text-white">
                    Upacara
                    <div class="in-2 md:text-2xl mt-3 text-xl font-semibold text-gray-500 dark:text-white">Senin/2 bulan
                        sekali</div>
                </div>
                <div class="in-1 mb-3 text-3xl md:text-5xl font-bold text-gray-100 dark:text-white">
                    Lempar Balon Air
                    <div class="in-2 md:text-2xl mt-3 text-xl font-semibold text-gray-500 dark:text-white">Akhir Tahun
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 4 -->
        <div
            class="s-r mt-20 w-full p-4 text-justify bg-primary text-white border border-gray-200 shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
            <div class="flex flex-col md:flex-row items-stretch justify-center md:gap-10">
                <div class="w-full h-auto flex flex-col items-start justify-center md:ml-20">
                    <div class="s-l mb-2 md:mb-3 text-2xl font-bold  sm:text-lg dark:text-gray-400">
                        Our Mission
                    </div>
                    <div class="s-r-3 mb-2 md:mb-5 text-5xl font-bold dark:text-white max-w-full">
                        Our Mission
                    </div>
                    <p class="s-b-4 mb-5 md:text-2xl text-sm dark:text-gray-400">Menjadi platform terdepan di dunia
                        dalam
                        menyediakan solusi ruang kerja fleksibel yang menggabungkan efisiensi, kenyamanan, dan teknologi
                        modern. Kami bertujuan untuk menciptakan ekosistem ruang kerja yang memberdayakan perusahaan dan
                        karyawan dalam beradaptasi dengan perubahan cepat dunia kerja digital, sehingga mereka dapat
                        mencapai tingkat produktivitas dan kreativitas tertinggi.</p>
                </div>

                <div class="s-r-3 w-full text-justify h-auto p-4 bg-white border rounded-lg shadow sm:p-8">
                    <div class="in flex justify-center md:gap-10 flex-col h-full intern">
                        <div class="in-2 my-3 flex md:text-2xl text-sm font-bold text-gray-500 dark:text-white">
                            <div class="in-1 mr-5 bg-button w-12 h-auto"></div>Membangun ruang kerja yang menginspirasi
                            kreativitas dan kolaborasi dengan mempermudah pengelolaan ruang secara efektif.
                        </div>
                        <div class="in-2 my-3 flex md:text-2xl text-sm font-bold text-gray-500 dark:text-white">
                            <div class="in-1 mr-5 bg-button w-12 h-auto"></div>Membantu perusahaan dalam mengoptimalkan
                            penggunaan aset kantor dan meningkatkan produktivitas tim dengan solusi ruang kerja yang
                            adaptif.
                        </div>
                        <div class="in-2 my-3 flex md:text-2xl text-sm font-bold text-gray-500 dark:text-white">
                            <div class="in-1 mr-5 bg-button w-12 h-auto"></div>Menyediakan sistem pemesanan kursi yang
                            mudah
                            digunakan untuk memaksimalkan penggunaan ruang kerja di lingkungan kantor yang dinamis.
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</template>

<script setup>
import imgUn from '../assets/undraw_phone_call_re_hx6a1.png';
</script>

<script>
// Import ScrollReveal
import ScrollReveal from 'scrollreveal';

export default {
    name: 'AboutComponents',
    data() {
        return {
            isExpanded: false,
            fullText: 'Kami percaya bahwa lingkungan kerja yang nyaman dan fleksibel adalah kunci untuk mencapai produktivitas maksimal. Kami hadir untuk memberikan solusi modern dalam pengelolaan ruang kerja, dengan sistem booking kursi yang dirancang untuk mendukung cara kerja dinamis di era digital. Mari ciptakan tempat kerja yang lebih efisien, di mana Anda dapat fokus pada yang terpenting—mengejar tujuan dan meraih prestasi. Bersama kami, Anda bisa mengatur ruang kerja sesuai kebutuhan, meningkatkan kolaborasi, dan memaksimalkan kreativitas setiap hari.',
            fullText1: 'Kami berkomitmen untuk menyediakan sistem manajemen ruang kerja yang intuitif dan efisien, memungkinkan perusahaan untuk mengoptimalkan penggunaan ruang kerja mereka. Dengan mengurangi ruang kosong yang tidak terpakai dan memberikan fleksibilitas kepada karyawan untuk memilih tempat kerja yang sesuai dengan kebutuhan mereka, kami berupaya membantu perusahaan mencapai efisiensi operasionalyang lebih baik.',
            fullText2: 'Di era dimana pola kerja hybrid dan remote semakin meningkat, kami menyediakan platform yang memungkinkan karyawan untuk menyesuaikan ruang kerja mereka dengan fleksibilitas penuh. Dengan sistem bookingyang mudah digunakan, karyawan dapat bekerja dari kursi mana pun yang mereka pilih, kapan pun mereka butuhkan, sehingga menciptakan keseimbangan antara produktivitas dan kenyamanan.',
            fullText3: 'Kami percaya bahwa karyawan yang puas adalah aset terbesar perusahaan. Dengan menyediakan ruang kerja yang nyaman,terorganisir, dan disesuaikan dengan kebutuhan individu, kami berupaya meningkatkan kesejahteraan karyawan, yang pada akhirnya berkontribusi pada peningkatan kepuasan kerja dan produktivitas yang lebih tinggi.',
        }
    },
    computed: {
        shortText() {
            return `${this.fullText.slice(0, 150)}...`
        },
        shortText1() {
            return `${this.fullText1.slice(0, 150)}...`
        },
        shortText2() {
            return `${this.fullText2.slice(0, 150)}...`
        },
        shortText3() {
            return `${this.fullText3.slice(0, 150)}...`
        },
    },
    methods: {
        toggleText() {
            this.isExpanded = !this.isExpanded
        }
    },
    mounted() {
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000, // Durasi animasi dalam milidetik
            distance: '60px', // Jarak elemen akan muncul
            delay: 300, // Jeda antara setiap animasi
            reset: true, // Jika true, animasi akan dijalankan lagi setiap kali elemen terlihat
        });
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-l-2', { delay: 200, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 100, origin: 'right' });
        ScrollReveal().reveal('.s-r-3', { delay: 300, origin: 'right' });
        ScrollReveal().reveal('.s-t', { delay: 100, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-4', { delay: 400, origin: 'bottom' });
        ScrollReveal().reveal('.in .in-1', { delay: 300, origin: 'bottom', interval: 200 })
        ScrollReveal().reveal('.in .in-2', { delay: 500, origin: 'right', interval: 200 })
    }
}
</script>