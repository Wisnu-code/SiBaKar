<template>
    <main>

        <SidebarComponents />

        <div
            class="flex justify-center items-center md:h-[80vh] md:min-h-[80vh] min-h-screen h-full md:text-2xl text-xl text-justify overflow-hidden">
            <div
                class="flex flex-col items-center justify-center bg-gray-50 md:rounded-2xl rounded-xl md:w-[70%] md:h-[85%] h-[100%] shadow-lg overflow-hidden md:p-10 s-b">
                <div class="text-3xl md:text-5xl font-semibold uppercase md:mb-10 mb-5 s-l">Events</div>

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
                                                    Events</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Day & Time</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Details</th>
                                                <th scope="col"
                                                    class="px-6 py-3 text-start font-medium text-gray-500 uppercase">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="divide-y divide-gray-200">
                                            <tr v-for="event in filteredEvents" :key="event.id">
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg font-medium text-gray-800">
                                                    {{ event.id }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ event.name }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ event.time }}
                                                </td>
                                                <td
                                                    class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    {{ event.detail }}
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm md:text-lg text-gray-800">
                                                    <button @click="deleteEvent(event.id)" type="button" class="text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">Delete</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full flex justify-end items-center pt-5 s-l">
                    <button @click="openModal" 
                        class="text-blue-700 hover:text-white border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 uppercase rounded-lg text-base font-semibold px-5 py-2.5 text-center me-2 dark:border-blue-500 dark:text-blue-500 dark:hover:text-white dark:hover:bg-blue-500 dark:focus:ring-blue-800 transition-all active:scale-95 active:rotate-3 hover:scale-110">Add</button>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div
        v-if="isModalOpen"
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
    >
        <div class="bg-white w-full max-w-md p-6 rounded-lg shadow-lg">
            <h2 class="text-xl font-bold mb-4">Create New Event</h2>

            <form @submit.prevent="addEvent">
                <div class="mb-4">
                    <label for="eventName" class="block mb-1">Event Name</label>
                    <input
                        type="text"
                        id="eventName"
                        v-model="newEvent.name"
                        class="border w-full px-3 py-2 rounded-lg"
                        placeholder="Enter event name"
                        required
                    />
                </div>

                <div class="mb-4">
                    <label for="eventTime" class="block mb-1">Event Time</label>
                    <input
                        type="text"
                        id="eventTime"
                        v-model="newEvent.time"
                        class="border w-full px-3 py-2 rounded-lg"
                        placeholder="Day/01-01-0001"
                        required
                    />
                </div>

                <div class="mb-4">
                    <label for="eventDetail" class="block mb-1">Event Details</label>
                    <textarea
                        id="eventDetail"
                        v-model="newEvent.detail"
                        class="border w-full px-3 py-2 rounded-lg"
                        placeholder="Enter event details"
                        rows="4"
                        required
                    ></textarea>
                </div>

                <div class="flex justify-end gap-2">
                    <button
                        type="button"
                        @click="closeModal"
                        class="bg-gray-300 px-4 py-2 rounded-lg hover:bg-gray-400"
                    >
                        Cancel
                    </button>
                    <button
                        type="submit"
                        class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
                    >
                        Save
                    </button>
                </div>
            </form>
        </div>
    </div>
    </main>
</template>

<script>
import SidebarComponents from './SidebarComponents.vue';
import axios from 'axios';  // Import axios

export default {
  components: {
    SidebarComponents,
  },

  data() {
    return {
      searchQuery: '',
      isModalOpen: false,
      events: [],  // Data event kosong, akan diambil dari API
      newEvent: {
        name: '',
        time: '',
        detail: '',
      },
    };
  },

  computed: {
    filteredEvents() {
      if (this.searchQuery) {
        return this.events.filter(event =>
          event.anEvent.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          event.time.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          event.detail.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      }
      return this.events;
    }
  },

  methods: {
    openModal() {
      this.isModalOpen = true;
    },

    closeModal() {
      this.isModalOpen = false;
    },

    // Fetch events from API
    async fetchEvents() {
      try {
        const response = await axios.get('http://localhost:8080/events'); // Ganti dengan URL backend Anda
        this.events = response.data;
      } catch (error) {
        console.error('Error fetching events:', error);
      }
    },

    // Add event to API
    async addEvent() {
      try {
        const response = await axios.post('http://localhost:8080/events', {
          name: this.newEvent.name,
          time: this.newEvent.time,
          detail: this.newEvent.detail,
        });

        // After adding event, update the events list
        this.events.push(response.data);

        // Reset form
        this.newEvent.name = '';
        this.newEvent.time = '';
        this.newEvent.detail = '';

        // Close modal
        this.closeModal();
      } catch (error) {
        console.error('Error adding event:', error);
      }
    },

    async deleteEvent(id) {
        try {
            const response = await fetch(`http://localhost:8080/events/delete?id=${id}`, {
                method: 'DELETE',
            });

            if (response.ok) {
                this.events = this.events.filter(event => event.id !== id);
                alert('Event deleted successfully');
            } else {
                const errorMessage = await response.text();
                alert('Error: ' + errorMessage)
            }
        } catch (error) {
            console.error('Error deleting event:', error);
            alert('An error occured while deleting the event')
        }
    }
  },

  mounted() {
    // Get events on component mount
    this.fetchEvents();
  }
};
</script>