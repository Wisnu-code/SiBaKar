<template>
    <!-- component -->
    <div class="flex justify-center items-center h-screen bg-sky-100 overflow-hidden">
        <!-- Left: Register Form -->
        <div class="md:ml-10 lg:p-20 p-8 h-full w-full lg:w-1/2 bg-white">
            <h1 class="text-3xl md:text-5xl md:font-bold font-semibold mb-4 cont">
                <span class="capitalize">r </span><span class="capitalize">e </span><span class="capitalize">g </span><span class="capitalize">i </span><span class="capitalize">s t </span><span class="capitalize">e </span><span class="capitalize">r </span>
            </h1>
            <form @submit.prevent="handleRegister">
                <!-- Username Input -->
                <div class="mb-4 s-l">
                    <label for="username" class="block text-lg font-semibold md:text-2xl text-gray-600">Username</label>
                    <input type="text" id="username" name="username"
                        class="block text-lg font-semibold md:text-2xl py-2.5 px-0 w-full text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off" v-model="username">
                </div>
                <div class="mb-4 s-l">
                    <label for="fullname" class="block text-lg font-semibold md:text-2xl text-gray-600">Fullname</label>
                    <input type="text" id="fullname" name="fullname"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off" v-model="fullname">
                </div>
                <!-- Password Input -->
                <div class="mb-4 relative s-l">
                    <label for="password" class="block text-lg font-semibold md:text-2xl text-gray-600">Password</label>
                    <input type="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off" v-model="password">
                </div>
                <div class="mb-4 relative s-l">
                    <label for="confirmPassword" class="block text-lg font-semibold md:text-2xl text-gray-600">Ulangi Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off" v-model="confirmPassword">
                </div>
                <!-- Register Button -->
                <button type="submit" class="relative text-lg md:text-2xl md:font-bold font-semibold rounded-md h-[50px] w-full overflow-hidden bg-white text-green-900 hover:scale-105 hover:shadow-lg transition-all before:absolute before:left-0 before:right-0 before:top-0 before:h-0 before:w-full before:bg-green-900 before:duration-500 after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0 after:w-full after:bg-green-900 after:duration-500 hover:text-white hover:shadow-green-900 hover:before:h-2/4 hover:after:h-2/4"><span
                        class="relative z-10">Daftar</span></button>
            </form>

            <!-- Switch to Login Page -->
            <div class="mt-6 text-green-500 text-center text-lg md:text-2xl md:font-bold font-semibold">
                <router-link to="/login">
                    <button class="relative h-[50px] w-40 overflow-hidden text-green-400 transition-all before:absolute before:left-0 before:top-0 before:h-full before:w-0 before:duration-500 after:absolute after:right-0 after:top-0 after:h-full after:w-0 after:duration-500 hover:text-white hover:shadow-green-400 hover:before:w-2/4 hover:before:bg-green-400 hover:after:w-2/4 hover:after:bg-green-400 hover:scale-105 hover:shadow-lg"><span class="relative z-10">Masuk Di Sini</span></button>
                </router-link>
            </div>
        </div>

        <!-- Right: Image -->
        <div class="w-1/2 h-[80%] hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

// State variables
const username = ref('');
const fullname = ref('');
const password = ref('');
const confirmPassword = ref('');

const router = useRouter();

// Handle Register Form Submission
const handleRegister = async () => {
    // Check if passwords match
    if (password.value !== confirmPassword.value) {
        alert('Password tidak cocok. Silakan coba lagi.');
        return;
    }

    try {
        const response = await fetch('http://localhost:8080/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                username: username.value,
                fullname: fullname.value,
                password: password.value
            }),
        });

        if (!response.ok) {
            throw new Error('Pendaftaran gagal: ' + response.statusText);
        }

        const data = await response.json();
        alert('Pendaftaran berhasil!');
        router.push("/login"); // Navigate to login page after successful registration
    } catch (error) {
        alert('Error: ' + error.message);
    }
};
</script>
