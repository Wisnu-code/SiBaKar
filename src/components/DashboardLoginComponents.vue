<template>
    <main class="flex justify-center items-center w-screen h-screen overflow-hidden">

            <div
                class="w-full md:max-w-[70%] p-4 bg-white border border-gray-200 rounded-lg shadow sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700 s-b">
                <form class="space-y-6" action="#">
                    <h5 class="text-xl md:text-3xl font-medium text-gray-900 dark:text-white s-l">Sign in to our platform</h5>
                    <div>
                        <label for="email" class="block mb-2 text-sm md:text-2xl font-medium text-gray-900 dark:text-white s-t">Your
                            username</label>
                        <input type="email" name="email" id="email"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm md:text-xl rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white s-r"
                            placeholder="username" required />
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm md:text-2xl font-medium text-gray-900 dark:text-white s-t">Your
                            password</label>
                        <input type="password" name="password" id="password" placeholder="••••••••"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm md:texl-2xl rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white s-r"
                            required />
                    </div>
                    <button type="submit"
                        class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm md:text-xl px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 s-b-5">Login
                        to your account</button>
                </form>
            </div>

    </main>
</template>

<script>
import ScrollReveal from 'scrollreveal';
export default {
    name: 'DashboardLoginComponents',
    data() {
        return {
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
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-t', { delay: 200, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-5', { delay: 500, origin: 'bottom' });
    }
}
</script>