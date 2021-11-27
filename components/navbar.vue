<template>
  <div>
    <div ref="overlay" class="overlay"></div>
    <b-navbar variant="faded" type="dark" class="d-flex">
      <b-navbar-brand tag="h1" class="mb-0"> Logo </b-navbar-brand>
      <b-nav class="mx-auto">
        <b-nav-item
          v-for="item in items"
          :key="item.text"
          :class="{'selected': item.active}"
          @mouseover="navTransitionOn"
          @mouseout="navTransitionOff"
          @click="selectNav(item)">
          {{ item.text }}
        </b-nav-item>
      </b-nav>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: "Navbar",
  data() {
      return {
        items: [
          {text: 'Buy', href: '#', active: true},
          {text: 'Mixer', href: '#', active: false},
          {text: 'Swap', href: '#', active: false},
        ]
      }
  },
  methods: {
    navTransitionOn(event) {
      const target = event.target;
      const parent = target.parentNode;
      const position = parent.getBoundingClientRect();
      const overlay = this.$refs.overlay;

      overlay.classList.add('active');
      overlay.style.left = position.x + 'px';
      overlay.style.top = position.y + 'px';
      overlay.style.height = position.height + 'px';
      overlay.style.width = position.width + 'px';
    },
    navTransitionOff() {
      const overlay = this.$refs.overlay;
      overlay.classList.remove('active');
    },
    selectNav(item) {
      this.items.forEach((item) => {
        item.active = false
      });
      item.active = true;
    }
  }
}
</script>

<style scoped>
  .selected {
    background-color: rgb(179, 179, 179);
    border-radius: 10px;
  }
</style>
