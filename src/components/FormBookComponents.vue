<template>
    <!-- component -->
    <div class="flex h-screen bg-sky-100">
        <!-- Right: Login Form -->
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-2xl font-semibold mb-4">Booking Seat</h1>
            <form action="#" method="POST">
                <!-- Username Input -->
                <div class="mb-4" bg-sky-100>
                    <label for="namalengkap" class="block text-gray-600">Nama Lengkap</label>
                    <input type="text" id="namalengkap" name="namalengkap"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4" bg-sky-100>
                    <label for="namadivisi" class="block text-gray-600">Divisi/Tim</label>
                    <input type="text" id="namadivisi" name="namadivisi"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4">
                    <label for="service" class="block text-gray-600">silahkan pilih bangku yang tersisa</label>
                    <select id="service" 
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        required>
                        <option disabled value="">Silahkan pilih satu</option>
                        <!-- <option v-for="service in services" :key="service.id" :value="service.name">{{ service.name }}
                        </option> -->
                    </select>
                </div>
                <!-- Remember Me Checkbox -->
                <div class="mb-4 flex items-center">
                    <input type="checkbox" id="remember" name="remember" class="text-red-500">
                    <label for="remember" class="text-green-900 ml-2">Remember Me</label>
                </div>
                <!-- Login Button -->
                <button type="submit"
                    class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full">Booking</button>
            </form>
            <!-- Sign up  Link
            <div class="mt-6 text-green-500 text-center">
                <a href="#" class="hover:underline">Sign up Here</a>
            </div> -->
        </div>
        <!-- Left: Image -->
        <div class="w-1/2 max-h-screen hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/s1.svg" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
    </div>
</template>