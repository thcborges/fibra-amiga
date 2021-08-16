<template>
  <b-container>
  <b-navbar-nav variant="info" type="dark">
    <b-navbar-brand href="#">Fibra Amiga</b-navbar-brand>
  </b-navbar-nav>
    <b-form v-if="show" @submit="onSubmit" @reset="onReset">
      <b-form-group
        id="input-group-1"
        label="Quantas pessoas moram na sua casa?"
        label-for="qtd_pessoas"
      >
        <b-form-input
          id="qtd_pessoas"
          v-model="form.qtd_pessoas"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-2"
        label="Quantas crianças?"
        label-for="qtd_criancas">
        <b-form-input
          id="qtd_criancas"
          v-model="form.qtd_criancas"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-3"
        label="Quantos adolescentes?"
        label-for="qtd_adolescentes">
        <b-form-input
          id="qtd_adolescentes"
          v-model="form.qtd_adolescentes"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-4"
        label="Qual a velocidade da sua internet?"
        label-for="velocidade_internet"
        description="Em Mb">
        <b-form-input
          id="velocidade_internet"
          v-model="form.velocidade_internet"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group v-slot="{ ariaDescribedby }" label="Possui wifi?">
        <b-form-radio-group
          id="wifi"
          v-model="form.wifi"
          name="radio-wifi"
          :aria-describedby="ariaDescribedby"
          :options="possui_wifi">
        </b-form-radio-group>
      </b-form-group>

      <b-form-group
        v-slot="{ ariaDescribedby }"
        label="Quantos dispositivos possui?">
        <b-form-group
          label="Smartphones:"
          label-for="smartphone">
          <b-form-radio-group
            id="smartphone"
            v-model="form.qtd_smartphone"
            name="smartphone"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Smart TV:"
          label-for="smarttv">
          <b-form-radio-group
            id="smarttv"
            v-model="form.qtd_smarttv"
            name="smarttv"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Notebook:"
          label-for="notebook">
          <b-form-radio-group
            id="notebook"
            v-model="form.qtd_notebook"
            name="notebook"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Desktop:"
          label-for="desktop">
          <b-form-radio-group
            id="desktop"
            v-model="form.qtd_desktop"
            name="desktop"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Tablet:"
          label-for="tablet">
          <b-form-radio-group
            id="tablet"
            v-model="form.qtd_tablet"
            name="tablet"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Video Game:"
          label-for="videogame">
          <b-form-radio-group
            id="videogame"
            v-model="form.qtd_videogame"
            name="videogame"
            :aria-describedby="ariaDescribedby"
            :options="dispositivos">
          </b-form-radio-group>
        </b-form-group>
      </b-form-group>

      <b-form-group
        id="input-group-5"
        label="Quanto tempo em média sua família passa assistindo filmes ou séries?"
        label-for="tempo_filmes_series"
        description="Em minutos">
        <b-form-input
          id="tempo_filmes_series"
          v-model="form.tempo_filmes_series"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-6"
        label="Quanto tempo em média, por dia, sua família passa fazendo videoconferências?"
        label-for="tempo_videoconferencias"
        description="Em minutos">
        <b-form-input
          id="tempo_videoconferencias"
          v-model="form.tempo_videoconferencias"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-7"
        label="Quanto tempo em média, por dia, sua família passa jogando online?"
        label-for="tempo_jogo_online"
        description="Em minutos">
        <b-form-input
          id="tempo_jogo_online"
          v-model="form.tempo_jogo_online"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-8"
        label="Quanto tempo em média, por dia, sua família passa navegando na internet e redes sociais?"
        label-for="tempo_rede_sociais"
        description="Em minutos">
        <b-form-input
          id="tempo_rede_sociais"
          v-model="form.tempo_rede_sociais"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-9"
        label="Quanto tempo em média, por dia, sua família passa assistindo Globoplay, Netflix, Amazon Prime, HBO, Disney Plus?"
        label-for="tempo_stream_video"
        description="Em minutos">
        <b-form-input
          id="tempo_stream_video"
          v-model="form.tempo_stream_video"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        v-slot="{ ariaDescribedby }"
        label="Quais os principais problemas que você precisa resolver com sua internet banda larga por fibra?">
        <b-form-group
          label="Quer ter mais velocidade?"
          label-for="mais_velocidade">
          <b-form-radio-group
            id="mais_velocidade"
            v-model="form.mais_velocidade"
            name="mais_velocidade"
            :aria-describedby="ariaDescribedby"
            :options="possui_wifi">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Parar travamento de vídeos?"
          label-for="menos_travamento">
          <b-form-radio-group
            id="menos_travamento"
            v-model="form.menos_travamento"
            name="menos_travamento"
            :aria-describedby="ariaDescribedby"
            :options="possui_wifi">
          </b-form-radio-group>
        </b-form-group>
        <b-form-group
          label="Resolver pixelização ou problema de nitidez de imagens?"
          label-for="menos_pixelamento">
          <b-form-radio-group
            id="menos_pixelamento"
            v-model="form.menos_pixelamento"
            name="menos_pixelamento"
            :aria-describedby="ariaDescribedby"
            :options="possui_wifi">
          </b-form-radio-group>
        </b-form-group>
      </b-form-group>

      <b-form-group
        id="input-group-9"
        label="Quantas pessoas usam internet simultaneamente a maior parte do dia?"
        label-for="uso_simultaneo">
        <b-form-input
          id="uso_simultaneo"
          v-model="form.uso_simultaneo"
          type="number"
          required
        ></b-form-input>
      </b-form-group>

      <b-button v-b-modal.modal-1 type="submit" variant="primary">Calcular</b-button>
      <b-button type="reset" variant="danger">Apagar</b-button>
    </b-form>
    <b-card class="mt-3" header="Form Data Result">
      <pre class="m-0">{{ discurso }}</pre>
    </b-card>
    <b-modal id="modal-1" title="BootstrapVue">
      <p class="my-4">{{ discurso }}</p>
    </b-modal>
  </b-container>
</template>

<script>
  export default {
    data() {
      return {
        form: {
          qtd_pessoas: 0,
          qtd_criancas: 0,
          qtd_adolescentes: 0,
          velocidade_internet: 0,
          wifi: 0,
          qtd_smartphone: 0,
          qtd_smarttv: 0,
          qtd_notebook: 0,
          qtd_desktop: 0,
          qtd_tablet: 0,
          qtd_videogame: 0,
          tempo_filmes_series: 0,
          tempo_videoconferencias: 0,
          tempo_jogo_online: 0,
          tempo_rede_sociais: 0,
          tempo_stream_video: 0,
          mais_velocidade: 0,
          menos_travamento: 0,
          menos_pixelamento: 0,
          uso_simultaneo: 0,
        },
        possui_wifi: [
          {text: 'Sim', value: 1},
          {text: 'Não', value: 0},
        ],
        dispositivos: [1, 2, 3, 4, 5],
        show: true,
        discurso: ""
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        const totalPontos = this.getTotalPontos()
        this.discurso = this.getDiscurso(totalPontos)
      },
      onReset(event) {
        event.preventDefault()
        // Reset our form values
        this.form.qtd_pessoas = 0
        this.form.qtd_criancas = 0
        this.form.qtd_adolescentes = 0
        this.form.velocidade_internet = 0
        this.form.wifi = 0
        this.form.qtd_smartphone = 0
        this.form.qtd_smarttv = 0
        this.form.qtd_notebook = 0
        this.form.qtd_desktop = 0
        this.form.qtd_tablet = 0
        this.form.qtd_videogame = 0
        this.form.tempo_filmes_series = 0
        this.form.tempo_videoconferencias = 0
        this.form.tempo_jogo_online = 0
        this.form.tempo_rede_sociais = 0
        this.form.tempo_stream_video = 0
        this.form.mais_velocidade = 0
        this.form.menos_travamento = 0
        this.form.menos_pixelamento = 0
        this.form.uso_simultaneo = 0
        this.discurso = ""
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      },
      getTotalPontos() {
        return this.form.qtd_pessoas +
          this.form.qtd_criancas +
          this.form.qtd_adolescentes +
          this.form.wifi +
          this.form.qtd_smartphone +
          this.form.qtd_smarttv +
          this.form.qtd_notebook +
          this.form.qtd_desktop +
          this.form.qtd_tablet +
          this.form.qtd_videogame +
          this.form.tempo_filmes_series +
          this.form.tempo_videoconferencias +
          this.form.tempo_jogo_online +
          this.form.tempo_rede_sociais +
          this.form.tempo_stream_video +
          this.form.mais_velocidade +
          this.form.menos_travamento +
          this.form.menos_pixelamento +
          this.form.uso_simultaneo;
      },
      getDiscurso(totalPontos) {
        if (totalPontos <= 7 && this.form.velocidade_internet > 100) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 100GB de download, que te permitirá navegar com maior tranquilidade e 60 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 99,9"
        } else if (totalPontos <= 14 && this.form.velocidade_internet > 100) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 100GB de download, que te permitirá navegar com maior tranquilidade e 60 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 99,9"
        } else if (totalPontos <= 21 && this.form.velocidade_internet > 100) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 100GB de download, que te permitirá navegar com maior tranquilidade e 60 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 99,9"
        } else if (totalPontos <= 28) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 500GB de download, que te permitirá navegar com maior tranquilidade e 250 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 149,9"
        } else if (totalPontos <= 35) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 500GB de download, que te permitirá navegar com maior tranquilidade e 250 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 149,9"
        } else if (totalPontos <= 42) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 500GB de download, que te permitirá navegar com maior tranquilidade e 250 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 149,9"
        } else if (totalPontos <= 49) {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 500GB de download, que te permitirá navegar com maior tranquilidade e 250 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 149,9"
        } else {
          return "Analisando seu perfil, recomendamos a internet com velocidade de 500GB de download, que te permitirá navegar com maior tranquilidade e 250 e te deixará tranquilo quando precisar falar com a empresa e os amigos na internet. Sendo fibra, é um excelente, garantindo velocidade contante, num valor imbatível de R$ 149,9"
        }
      }
    }
  }
</script>
