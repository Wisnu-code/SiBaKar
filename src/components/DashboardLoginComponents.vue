<template>
    <main class="flex justify-center items-center w-screen h-screen overflow-hidden">
        <div class="w-full md:max-w-[70%] p-4 bg-white border border-gray-200 rounded-lg shadow sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700 s-b">
            <form class="space-y-6" @submit.prevent="submitForm">
                <h5 class="text-xl md:text-3xl font-medium text-gray-900 dark:text-white s-l">Masuk ke halaman dashboard</h5>
                <div>
                    <label for="username" class="block mb-2 text-sm md:text-2xl font-medium text-gray-900 dark:text-white s-t">Username</label>
                    <input type="text" name="username" id="username" v-model="username"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm md:text-xl rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white s-r"
                        placeholder="username" required />
                </div>
                <div>
                    <label for="password" class="block mb-2 text-sm md:text-2xl font-medium text-gray-900 dark:text-white s-t">Password</label>
                    <input type="password" name="password" id="password" v-model="password" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm md:text-2xl rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white s-r"
                        required />
                </div>
                <button type="submit"
                    class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm md:text-xl px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 s-b-5">
                    Silahkan masuk ke dashboard admin
                </button>
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
            username: '',  // Gunakan username di data, karena itu yang digunakan di v-model
            password: '',
            errorMessages: ''
        };
    },

    mounted() {
        if (localStorage.getItem('token')) {
            this.$router.push('/dashboard');
        }
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000,
            distance: '60px',
            delay: 300,
            reset: false,
        });
        ScrollReveal().reveal('.s-r', { delay: 300, origin: 'right' });
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-t', { delay: 200, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-5', { delay: 500, origin: 'bottom' });
    },

    methods: {
        async submitForm() {
            if (!this.username || !this.password) {
                this.errorMessages = 'Username dan password harus diisi';
                return;
            }

            try {
                // Mengirim data login ke backend
                const response = await fetch('http://localhost:8080/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        username: this.username, // Gunakan username yang benar
                        password: this.password,
                    }),
                });

                // Jika login berhasil
                if (response.ok) {
                    const data = await response.json();
                    console.log(data);

                    // Cek apakah role adalah 'admin' dan simpan token
                    if (data.user && data.user.role === 'admin') {
                        localStorage.setItem('token', data.token);
                        this.$router.push('/dashboard');
                    } else {
                        this.errorMessages = 'Hanya admin yang dapat mengakses ini';
                    }
                } else {
                    const errorData = await response.json();
                    this.errorMessages = errorData.message || 'Username atau password salah';
                }
            } catch (error) {
                console.error('Error saat login:', error);
                this.errorMessages = 'Terjadi kesalahan pada sistem';
            }
        }
    }
};
</script>
