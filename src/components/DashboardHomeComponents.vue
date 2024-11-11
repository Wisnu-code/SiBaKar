<template>
    <div>
        <SidebarComponents />

        <div class="flex justify-center items-center md:h-[80vh] md:min-h-[80vh] min-h-screen h-full md:text-2xl text-xl text-justify overflow-hidden">
            <div class="s-b flex justify-center items-center flex-col md:rounded-2xl md:w-[70%] md:h-[70%] h-full shadow-xl overflow-auto gap-5 bg-gray-800">
                <div class="flex flex-col justify-center bg-[rgba(255, 255, 255, 0)] rounded-[16px] shadow-lg text-white p-10 h-full">
                    <div class="indent-20 overflow-hidden">
                        <p v-if="isExpanded" class="s-r">
                            Website ini adalah platform pemesanan bangku yang dirancang khusus untuk karyawan guna memudahkan
                            mereka dalam mengatur tempat duduk saat bekerja di kantor. Sistem ini memungkinkan karyawan melihat peta
                            ketersediaan kursi secara real-time, memilih bangku yang diinginkan, serta menyesuaikan jadwal
                            pemesanan sesuai dengan kebutuhan mereka. Fitur-fitur yang mudah digunakan memastikan pengalaman pemesanan
                            yang cepat dan praktis, sehingga menghemat waktu dan meminimalkan kebingungan terkait alokasi tempat
                            duduk.
                        </p>
                        <p v-else class="s-r">
                            Website ini adalah platform pemesanan bangku yang dirancang khusus untuk karyawan guna memudahkan
                            mereka dalam mengatur tempat duduk saat bekerja di kantor... 
                        </p>
                        <button @click="isExpanded = !isExpanded" class="mt-4 text-gray-400 underline s-b-5">
                            {{ isExpanded ? 'Baca Lebih Sedikit' : 'Baca Selengkapnya' }}
                        </button>
                    </div>
                </div>
            </div>
        </div>

        
    </div>
</template>

<script>
import SidebarComponents from './SidebarComponents.vue'
import ScrollReveal from 'scrollreveal';
// import backgroundImage from '../assets/homeDashboard.png' // Import gambar

export default {
    components: {
        SidebarComponents,
    },
    data() {
        return {
            isExpanded: false, // Untuk mengontrol teks pendek/panjang
            // bgStyle: {
            //     backgroundColor: "#352213",
            //     backgroundImage: `url(${backgroundImage})`, // Path sesuai lokasi gambar Anda
            //     backgroundSize: "cover", // Menyesuaikan ukuran gambar
            //     backgroundRepeat: "no-repeat", // Agar gambar tidak diulang
            //     backgroundPosition: "center" // Memposisikan gambar di tengah
            // }
        }
    },
    mounted() {
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000, // Durasi animasi dalam milidetik
            distance: '60px', // Jarak elemen akan muncul
            delay: 300, // Jeda antara setiap animasi
            reset: false, // Jika false, animasi tidak akan dijalankan lagi setiap kali elemen terlihat
        });
        ScrollReveal().reveal('.s-r', { delay: 300, origin: 'right' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-5', { delay: 500, origin: 'bottom' });
    }
}
</script>
