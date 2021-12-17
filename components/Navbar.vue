<template>
  <div>
    <div ref="overlay" class="overlay"></div>
    <b-navbar variant="faded" type="dark" class="d-flex">
      <b-navbar-brand tag="h1" class="mb-0"> Logo </b-navbar-brand>
      <b-nav class="mx-auto">
        <nuxt-link v-for="item in items" :key="item.text" :to="item.href">
          <b-nav-item
            :href="item.href"
            @mouseover="navTransitionOn"
            @mouseout="navTransitionOff">
            {{ item.text }}
          </b-nav-item>
        </nuxt-link>
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
          {text: 'Buy', href: '/'},
          {text: 'Mixer', href: '/mixer'},
          {text: 'Swap', href: '/swap'},
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
  .nuxt-link-exact-active {
    background-color: rgb(179, 179, 179);
    border-radius: 10px;
  }
  .navbar {
    font-size: large;
  }
  .nav {
    margin-top : 2%;
    padding-left: 1%;
    padding-right: 1%;
    background-color: rgba(33, 33, 33, 0.5);
    border-radius: 10px;
  }
  .overlay{
    position: absolute;
    background-color: rgb(179, 179, 179);
    border-radius: 10px;
    z-index: -1;
    transition: .3s ease left, width, opacity;
    opacity: 0;
  }
  .overlay.active{
    opacity: 1;
  }
  .nav a {
    color: white;
    text-decoration: none;
  }
</style>
