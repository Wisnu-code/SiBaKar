<template>
    <div id="contact">
        <div class="s-r text-3xl text-center md:text-6xl font-bold mt-20 text-gray-600">Contact</div>

        <div
        class="md:m-20 mt-20 flex flex-col items-center rounded-lg md:flex-row max-w-full h-full dark:bg-gray-800 dark:hover:bg-gray-700">

            <div class="flex flex-col text-justify justify-between p-4 leading-normal w-full ">

                <!-- Text Content -->
                <h5 class="s-l mb-2 text-3xl md:text-5xl font-bold tracking-tight text-gray-600 dark:text-white">Ada
                    pertanyaan atau butuh bantuan? Kami siap membantu Anda!</h5>
                <p class="s-b mb-3 text-xl md:text-2xl font-normal text-gray-700 dark:text-gray-400">Silakan isi form di
                    bawah ini, dan tim kami akan segera menghubungi Anda. Kami berkomitmen memberikan respon secepat
                    mungkin untuk mendukung kebutuhan kerja Anda.</p>
            </div>

            <!-- Form -->
            <div class="r flex md:h-auto p-4 leading-normal w-full shadow bg-gray-50 rounded-lg">
                <form class="w-full md:w-96 md:mr-44 mx-auto overflow-hidden">

                    <div class="grid md:grid-cols-2 md:gap-6">
                        <div class="r-delay relative z-0 w-full mb-5 group">
                            <input type="text" name="floating_first_name" id="floating_first_name"
                                class="block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_first_name"
                                class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nama
                                Pertama</label>
                        </div>

                        <div class="r-delay relative z-0 w-full mb-5 group">
                            <input type="text" name="floating_last_name" id="floating_last_name"
                                class="block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_last_name"
                                class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nama
                                Terakhir</label>
                        </div>
                    </div>

                    <div class="r-delay relative z-0 w-full mb-5 group">
                        <input type="email" name="floating_email" id="floating_email"
                            class="block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            placeholder=" " required />
                        <label for="floating_email"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Alamat
                            Email</label>
                    </div>

                    <div class="grid grid-cols-3 md:gap-6">
                        <div class="r-delay relative z-0 w-full mb-5 group">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-lg font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-s-lg"
                                    type="button">
                                    +62
                                </div>
                            </div>
                        </div>

                        <div class="r-delay relative z-0 w-full mb-5 group col-span-2">
                            <input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" name="floating_phone"
                                id="floating_phone"
                                class="block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_phone"
                                class="  peer-focus:font-medium absolute text-lg text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nomor
                                Handphone</label>
                        </div>
                    </div>

                    <div class="r-delay relative z-0 w-full mb-5 group">

                        <label for="message" class="block mb-2 text-lg font-medium text-gray-400 dark:text-white">Pesan
                            Kamu</label>
                        <textarea id="message" rows="4"
                            class="  block p-2.5 w-full text-lg text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="Apa yang bisa kami bantu?"></textarea>

                    </div>

                    <button type="submit"
                        class="s-b text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-lg w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Kirim</button>
                </form>
            </div>

        </div>
    </div>
</template>

<script>
export default {
    name: 'ContactComponents'
}
</script>