<template>
    <div class="flex h-screen bg-sky-100">
        <!-- Left: Image -->
        <div class="w-1/2 max-h-screen hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
        <!-- Right: Login Form -->
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-2xl font-semibold mb-4">Login</h1>
            <form @submit.prevent="handleLogin">
                <!-- Username Input -->
                <div class="mb-4">
                    <label for="username" class="block text-gray-600">Username</label>
                    <input type="text" v-model="username" id="username" name="username"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Password Input -->
                <div class="mb-4">
                    <label for="password" class="block text-gray-800">Password</label>
                    <input type="password" v-model="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Login Button -->
                <button type="submit"
                    class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full">Login</button>
            </form>
            <!-- Sign up Link -->
            <div class="mt-6 text-green-500 text-center">
                <router-link to="/register" class="hover:underline">Sign up Here</router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            username: '',
            password: '',
        };
    },
    methods: {
        async handleLogin() {
            try {
                const response = await fetch('http://localhost:8080/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        username: this.username,
                        password: this.password,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Login failed: ' + response.statusText);
                }

                const data = await response.json();
                alert('Login successful! Token: ' + data.token);

                // Simpan token ke localStorage atau Vuex untuk digunakan di bagian lain aplikasi
                localStorage.setItem('token', data.token);
                // Redirect ke halaman lain setelah login
                this.$router.push('/'); // Ganti '/dashboard' dengan rute yang sesuai

            } catch (error) {
                alert('Error: ' + error.message);
            }
        },
    },
};
</script>

<style scoped>
/* Tambahkan style jika perlu */
</style>
