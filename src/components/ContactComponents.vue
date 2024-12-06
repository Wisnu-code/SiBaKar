<template>
    <div id="contact overflow-hidden ">
        <div class="text-3xl text-center md:text-6xl font-bold mt-20 text-gray-600 overflow-hidden">
            <div class="s-r">
                Contact
            </div>
        </div>

        <div
        class="s-b md:m-20 mt-20 flex flex-col items-center rounded-lg lg:flex-row max-w-full h-full dark:bg-gray-800 dark:hover:bg-gray-700 sm:px-10">

            <div class="flex flex-col text-justify lg:h-[28rem] justify-around items-center p-4 leading-normal w-full">

                <!-- Text Content -->
                <h5 class="s-l-2 mb-2 text-xl md:text-3xl font-bold tracking-tight text-gray-600 dark:text-white">Ada
                    pertanyaan atau butuh bantuan? Kami siap membantu Anda!</h5>
                <p class="s-b-4 mb-3 text-lg md:text-xl font-normal text-gray-700 dark:text-gray-400">Silakan isi form di
                    bawah ini, dan tim kami akan segera menghubungi Anda. Kami berkomitmen memberikan respon secepat
                    mungkin untuk mendukung kebutuhan kerja Anda.</p>
            </div>

            <!-- Form -->
            <div class="flex md:h-auto p-4 leading-normal w-full shadow bg-gray-50 rounded-lg">
                <form @submit.prevent="submitForm" class="w-full md:mr-44 mx-auto overflow-hidden">

                    <div class="grid md:grid-cols-2 md:gap-6">
                        <div class="in relative z-0 w-full mb-5 group">
                            <input v-model="contact.first_name" type="text" id="floating_first_name"
                                class="in-1 block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder="Nama Pertama" required />
                        </div>

                        <div class="in relative z-0 w-full mb-5 group">
                            <input v-model="contact.last_name" type="text" id="floating_last_name"
                                class="in-1 block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder="Nama Terakhir" required />
                        </div>
                    </div>

                    <div class="in relative z-0 w-full mb-5 group">
                        <input v-model="contact.email" type="email" id="floating_email"
                            class="in-1 block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            placeholder="Email " required />
                    </div>

                    <div class="grid grid-cols-3 md:gap-6">
                        <div class="in relative z-0 w-full mb-5 group">
                            <div class="flex items-center">
                                <div class="in-1 flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-lg font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-s-lg"
                                    type="button">
                                    +62
                                </div>
                            </div>
                        </div>

                        <div class="in relative z-0 w-full mb-5 group col-span-2">
                            <input v-model="contact.phone" type="tel"
                                id="floating_phone"
                                class="in-1 block py-2.5 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder="Nomor Hp " required />
                        </div>
                    </div>

                    <div class="in relative z-0 w-full mb-5 group">
                        <textarea v-model="contact.message" id="message" rows="4"
                            class="in-2 block p-2.5 w-full text-lg text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="Apa yang bisa kami bantu?"></textarea>

                    </div>

                    <button type="submit"
                        class="s-b-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-lg w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Kirim</button>
                </form>
            </div>

        </div>
    </div>
</template>

<script>
export default {
    name: 'ContactComponents',
    data() {
        return {
            contact: { 
                first_name: '', 
                last_name: '',
                email: '',
                phone: '',
                message: ''
            },
            responseMessage: ''
        };
    },
    methods: {
        async submitForm() {
            try {
                const response = await fetch('http://localhost:8080/contact', {
                    method: 'POST', 
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(this.contact)
                });
                const data = await response.json();
                this.responseMessage = data.message;

                if (response.ok) {
                    alert('Pesan berhasil dikirim!');
                    this.contact = {
                        first_name: '', 
                        last_name: '',
                        email: '',
                        phone: '',
                        message: ''
                    };
                } else {
                    alert('Gagal mengirim pesan. Silahkan coba lagi');
                }
            } catch (error) {
                console.error('Error submitting form:', error);
                alert('terjadi kesalahan. Silahkan coba lagi.');
            }
        }
    }
}
</script>
