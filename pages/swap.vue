<template>
  <div id="swap">
    <div class="card-content">
      <div>
        <b-card title="Swap">
          <b-form class="content" @submit="onSubmit">
            <div class="row">
              <b-form-input v-model="from.value" placeholder="0.0" type="number"></b-form-input>
              <multiselect v-model="from.currency"
                           :options="currencies"
                           select-label=""
                           deselect-label=""
                           placeholder=""
                           label="text"
                           track-by="text"
              >
                <template slot="option" slot-scope="props">
                  <div class="option__desc">
                    <img class="option__image" :src="props.option.img" :alt="props.option.value" height="15px">
                    <span class="option__title">{{ props.option.value }}</span>
                    <span class="option__small">{{ props.option.text }}</span>
                  </div>
                </template>

                <template slot="singleLabel" slot-scope="props">
                  <img class="option__image" :src="props.option.img" :alt="props.option.value" height="15px">
                  <span class="option__title">{{ props.option.text }}</span>
                </template>
              </multiselect>

              <b-form-input v-model="to.value" placeholder="0.0" type="number"></b-form-input>
              <multiselect v-model="to.currency"
                           :options="currencies"
                           select-label=""
                           deselect-label=""
                           placeholder=""
                           label="text"
                           track-by="text"
              >
                <template slot="option" slot-scope="props">
                  <div class="option__desc">
                    <img class="option__image" :src="props.option.img" :alt="props.option.value" height="15px">
                    <span class="option__title">{{ props.option.value }}</span>
                    <span class="option__small">{{ props.option.text }}</span>
                  </div>
                </template>

                <template slot="singleLabel" slot-scope="props">
                  <img class="option__image" :src="props.option.img" :alt="props.option.value" height="15px">
                  <span class="option__title">{{ props.option.text }}</span>
                </template>
              </multiselect>

              <b-button variant="success" type="submit">Connect portfolio</b-button>
            </div>
          </b-form>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
import Multiselect from 'vue-multiselect';
import currencies from '../data/currencies';

export default {
  components: { Multiselect },
  data() {
    return {
      from: {
        currency: null,
        value: null
      },
      to: {
        currency: null,
        value: null
      }
    }
  },
  computed: {
    currencies() {
      return currencies
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      alert('submitted') // here to call backend
    },
  }
}
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>

<style>
#swap {
  display: flex;
  justify-content: center;
  margin-top:3%;
}
</style>
