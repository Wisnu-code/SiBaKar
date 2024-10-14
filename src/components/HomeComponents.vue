<template>
    <div class="">
        <div
            class="md:m-20 mt-20 flex flex-col items-center rounded-lg shadow bg-gray-50 md:flex-row max-w-full md:min-h-96">

            <div class="flex flex-col justify-between items-center md:h-auto p-4 leading-normal w-full">

                <!-- Text Content -->
                <h5 class="mb-2 text-5xl font-bold tracking-tight text-gray-900 dark:text-white">Lorem ipsum dolor sit
                    amet.</h5>

                <!-- Button -->
                <button type="button"
                    class="buttons text-blue-800 text-lg font-medium me-2 px-2.5 py-0.5 flex justify-center max-w-28">Gass</button>
            </div>

            <!-- Img -->
            <div class="flex max-h-full pr-10 mt-10">
                <img class="object-cover w-full h-auto rounded-t-lg md:mr-10 md:w-fit md:rounded-none md:rounded-s-lg"
                    src="../assets/undraw_favourite_item_pcyo1.png" alt="">
            </div>
        </div>

        <!-- Tampilan Jumlah Karyawan -->
        <div class="mt-20 max-w-full h-auto p-4 text-center bg-gray-50 border rounded-lg shadow sm:p-8 md:mx-20">
            <div class="flex items-center justify-evenly md:gap-10 md:flex-row flex-col">
                <div class="mb-3 text-4xl md:text-6xl font-bold text-gray-800 dark:text-white">
                    150
                    <div class="md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Seat</div>
                </div>
                <div class="mb-3 text-4xl md:text-6xl font-bold text-gray-800 dark:text-white">
                    150
                    <div class="md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Seat</div>
                </div>
                <div class="mb-3 text-4xl md:text-6xl font-bold text-gray-800 dark:text-white">
                    150
                    <div class="md:text-3xl text-2xl font-bold text-gray-500 dark:text-white">Seat</div>
                </div>
            </div>
        </div>

        <!-- Tampilan Bangku -->

    </div>
</template>

<script setup>
</script>

<script>
export default {
    name: 'HomeComponents'
}
</script>

<style scoped>
.buttons:hover {
    border-bottom: 1px solid blue;
    transition: .5s;
}
</style>