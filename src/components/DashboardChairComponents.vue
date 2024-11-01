<template>
    <div>
        <SidebarComponents />

        <div class="flex h-[80vh] justify-center items-center md:text-2xl text-xl">
            <div class="flex flex-col items-center justify-center bg-gray-50 md:rounded-2xl rounded-xl md:w-[70%] md:h-[80%] h-[100%] shadow-lg overflow-hidden md:p-10 s-b">
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">Chair</div>
                
                <!-- Search Input -->
                <div class="mb-4 s-r">
                    <div class="relative md:left-60 md:translate-x-[100%] left-16">
                        <input
                            type="text"
                            v-model="searchQuery"
                            placeholder="Search..."
                            class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 text-sm"
                        >
                        <svg 
                            class="absolute left-3 top-2.5 h-5 w-5 text-gray-400"
                            xmlns="http://www.w3.org/2000/svg" 
                            fill="none" 
                            viewBox="0 0 24 24" 
                            stroke="currentColor"
                        >
                            <path 
                                stroke-linecap="round" 
                                stroke-linejoin="round" 
                                stroke-width="2" 
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                            />
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
                                                <th scope="col" class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    No.</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Nama</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Divisi</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Email</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-end font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="person in filteredData" :key="person.email">
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ person.number }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ person.name }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ person.title }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ person.email }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap text-end text-sm md:text-lg font-medium">
                                                    <button type="button"
                                                        @click="deletePerson(person)"
                                                        class="inline-flex items-center gap-x-2 text-sm md:text-lg font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none">
                                                        Delete
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
    </div>
</template>

<script>
import SidebarComponents from './SidebarComponents.vue';
import ScrollReveal from 'scrollreveal';

export default {
    components: {
        SidebarComponents
    },
    data() {
        return {
            searchQuery: '',
            tableData: [
                {
                    number: 1,
                    name: 'John Brown',
                    title: 'Regional Paradigm Technician',
                    email: 'john@site.com',
                },
                {
                    number: 2,
                    name: 'Jim Green',
                    title: 'Forward Response Developer',
                    email: 'jim@site.com',
                },
                {
                    number: 3,
                    name: 'Joe Black',
                    title: 'Product Directives Officer',
                    email: 'joe@site.com',
                }
            ]
        }
    },
    computed: {
        filteredData() {
            const query = this.searchQuery.toLowerCase()
            return this.tableData.filter(item => {
                return Object.values(item).some(value => 
                    String(value).toLowerCase().includes(query)
                )
            })
        }
    },
    methods: {
        deletePerson(person) {
            const index = this.tableData.indexOf(person)
            if (index > -1) {
                this.tableData.splice(index, 1)
            }
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
        ScrollReveal().reveal('.s-l', { delay: 300, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 600, origin: 'right' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
    }
}
</script>