<template>
    <div>
        <SidebarComponents />

        <div class="flex justify-center items-center md:h-[80vh] md:min-h-[80vh] min-h-screen h-full md:text-2xl text-xl text-justify overflow-hidden">
            <div class="flex justify-center items-center flex-col md:rounded-2xl md:w-[70%] md:h-[70%] h-full shadow-xl overflow-auto gap-5"
                :style="bgStyle">
                <div class="flex flex-col justify-center bg-[rgba(255, 255, 255, 0)] rounded-[16px] shadow-lg text-white p-10 h-full">
                    <div class="indent-20">
                        <p v-if="isExpanded">
                            Website ini adalah platform pemesanan bangku yang dirancang khusus untuk karyawan guna memudahkan
                            mereka dalam mengatur tempat duduk saat bekerja di kantor. Sistem ini memungkinkan karyawan melihat peta
                            ketersediaan kursi secara real-time, memilih bangku yang diinginkan, serta menyesuaikan jadwal
                            pemesanan sesuai dengan kebutuhan mereka. Fitur-fitur yang mudah digunakan memastikan pengalaman pemesanan
                            yang cepat dan praktis, sehingga menghemat waktu dan meminimalkan kebingungan terkait alokasi tempat
                            duduk.
                        </p>
                        <p v-else>
                            Website ini adalah platform pemesanan bangku yang dirancang khusus untuk karyawan guna memudahkan
                            mereka dalam mengatur tempat duduk saat bekerja di kantor...
                        </p>
                        <button @click="isExpanded = !isExpanded" class="mt-4 text-gray-400 underline">
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
import backgroundImage from '../assets/homeDashboard.png' // Import gambar

export default {
    components: {
        SidebarComponents
    },
    data() {
        return {
            isExpanded: false, // Untuk mengontrol teks pendek/panjang
            bgStyle: {
                backgroundColor: "#352213",
                backgroundImage: `url(${backgroundImage})`, // Path sesuai lokasi gambar Anda
                backgroundSize: "cover", // Menyesuaikan ukuran gambar
                backgroundRepeat: "no-repeat", // Agar gambar tidak diulang
                backgroundPosition: "center" // Memposisikan gambar di tengah
            }
        }
    }
}
</script>
