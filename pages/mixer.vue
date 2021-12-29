<template>
  <div id="mixer">
    <div class="card-content">
      <div>
        <b-card title="Crypto Mixer">
          <b-form @submit="onSubmit">
            <div class="container">
              <h5>1 - Receiver's bitcoin address</h5>
              <div class="row" v-for="(address, index) in addresses" :key="index">
                <b-form-group
                  id="group-email"
                  label="Email address:"
                  label-for="input-email"
                  class="col-sm"
                >
                  <b-form-input
                    id="input-email"
                    v-model="address.email"
                    type="email"
                    placeholder="Enter email"
                    required></b-form-input>
                </b-form-group>
                <b-form-group
                  id="group-delay"
                  label="Delay:"
                  label-for="input-delay"
                  class="col-sm"
                >
                  <b-form-select
                    id="input-delay"
                    v-model="address.delay"
                    required
                    :options="delays" />
                </b-form-group>
                <b-button variant="success" @click="addAddress" v-if="index === 0">Add another address</b-button>
                <b-button variant="danger" @click="removeAddress(index)" v-else>Delete address</b-button>
              </div>
              <h5>2 - Service fee</h5>
              <div class="row">
                <b-form-select
                  id="input-delay"
                  v-model="serviceFee"
                  required
                  :options="serviceFees" />
                <p>+ 0.0003 BTC per each address</p>
              </div>
              <h5>3 - Mixing code</h5>
              <b-form-input
                id="input-mixing-code"
                v-model="mixingCode"
                type="text"
                required></b-form-input>
              <b-button type="submit" variant="success">Continue</b-button>
            </div>
          </b-form>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "mixer",
  data() {
    return {
      addresses: [
        {email: null, delay: 0}
      ],
      serviceFee: 0.6,
      mixingCode: null
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      alert(JSON.stringify(this.getForm())) // here to call backend
    },
    addAddress() {
      this.addresses.push({email: null, delay: 0})
    },
    removeAddress(index) {
      this.$delete(this.addresses, index);
    },
    getForm() {
      return {
        addresses: this.addresses,
        serviceFee: this.serviceFee,
        mixingCode: this.mixingCode
      }
    }
  },
  computed: {
    delays() {
      const delays = [];

      for (let i = 0; i <= 24; i++) {
        delays.push({
          text: i + (i <= 1 ? ' hour' : ' hours'),
          value: i * 60 * 60,
        });
      }

      for (let i = 2; i <= 7; i++) {
        delays.push({
          text: i + ' days',
          value: i * 60 * 60 * 24,
        });
      }

      return delays;
    },
    serviceFees() {
      return [
        {text: '0.6 %', value: 0.6},
        {text: '0.645 %', value: 0.645},
        {text: '0.936 %', value: 0.936},
        {text: '1.289 %', value: 1.289},
        {text: '1.586 %', value: 1.586},
        {text: '1.904 %', value: 1.904},
      ]
    }
  }
}
</script>

<style scoped>
  #mixer {
    display: flex;
    justify-content: center;
    margin-top:3%;
  }
</style>
