<template>
    <main>
        <SidebarComponents />

        <div class="flex justify-center items-center md:h-[80vh] md:min-h-[80vh] min-h-screen h-full md:text-2xl text-xl text-justify overflow-hidden">
            <div class="flex flex-col items-center justify-center bg-gray-50 md:rounded-2xl rounded-xl md:w-[70%] md:h-[80%] h-[100%] shadow-lg overflow-hidden md:p-10 s-b">
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">Users Report</div>

                <!-- Search Input -->
                <div class="mb-4 s-r">
                    <div class="relative md:left-44 md:translate-x-[100%] left-16">
                        <input type="text" v-model="searchQuery" placeholder="Search..."
                            class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 text-sm">
                        <svg class="absolute left-3 top-2.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg"
                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>
                </div>

                <div class="flex flex-col w-full overflow-auto s-b">
                    <div class="flex flex-col overflow-h-auto overflow-w-auto h-[70%] w-full">
                        <div class="-m-1.5">
                            <div class="p-1.5 min-w-full inline-block align-middle">
                                <div class="">
                                    <table class="min-w-full divide-y divide-gray-200">
                                        <thead>
                                            <tr>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    ID</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Fullname</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Email</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Handphone</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Messages</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-end font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="report in filteredReports" :key="report.id">
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ report.id }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ report.fullname }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ report.email }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ report.handphone }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ report.messages }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-end text-sm md:text-lg font-medium">
                                                    <button type="button" 
                                                        class="inline-flex items-center gap-x-2 text-sm md:text-lg font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none">
                                                        Send Messages
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
</template>

<script>
import SidebarComponents from './SidebarComponents.vue';
import ScrollReveal from 'scrollreveal'

export default {
    components: {
        SidebarComponents,
    },
    data() {
        return {
            searchQuery: '',
            reports: [
                {
                    id: 1,
                    fullname: 'John Doe',
                    email: 'john.doe@example.com',
                    handphone: '081234567890',
                    messages: 'Website mengalami error saat melakukan login.',
                },
                {
                    id: 2,
                    fullname: 'Jane Smith',
                    email: 'jane.smith@example.com',
                    handphone: '082345678901',
                    messages: 'Tidak dapat mengakses halaman produk.',
                },
                {
                    id: 3,
                    fullname: 'Samuel Green',
                    email: 'samuel.green@example.com',
                    handphone: '083456789012',
                    messages: 'Terdapat masalah pada fitur pencarian.',
                },
                {
                    id: 4,
                    fullname: 'Alice Johnson',
                    email: 'alice.johnson@example.com',
                    handphone: '084567890123',
                    messages: 'Desain halaman kontak tidak responsif.',
                },
                {
                    id: 5,
                    fullname: 'Michael Brown',
                    email: 'michael.brown@example.com',
                    handphone: '085678901234',
                    messages: 'Proses checkout tidak berfungsi dengan baik.',
                },
            ]
        };
    },
    computed: {
        filteredReports() {
            if (this.searchQuery) {
                return this.reports.filter(report => 
                    report.fullname.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
                    report.email.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
                    report.messages.toLowerCase().includes(this.searchQuery.toLowerCase())
                );
            }
            return this.reports;
        }
    },
    mounted() {
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000,
            distance: '60px',
            delay: 300,
            reset: false,
        });
        ScrollReveal().reveal('.s-l', { delay: 300, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 600, origin: 'right' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
    }
}
</script>