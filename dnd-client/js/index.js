class CharacterApi{
    static getCharacterClasses () {
        return fetch(`${CharacterApi.base_url}/characterclasses`)
                .then(res => res.json())
    }

    static getRaces (){
        return fetch(`${CharacterApi.base_url}/races`)
                .then(res => res.json())
    }

    static getcharacters(){
        return fetch(`${CharacterApi.base_url}/characters`)
                .then(res => res.json())
    }
    
    stat
    static getCharacterclassShow(characterclassId){
        return fetch(`${CharacterApi.base_url}/characterclasses/${characterclassId}`)
        .then(res => res.json())
        .then(json => {
            const {
                data:{
                    id,
                    attributes: {
                        name,
                        hit_die,
                        img_url,
                        proficiencies
                    }
                },
            } = json
            return {
                id,
                name,
                hit_die,
                img_url,
            }
        })
    }

    static createCharacter(characterAttributes){
        return fetch(`${CharacterApi.base_url}/characters`,{
            method:'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accetp': 'application/json'
            },
            body: JSON.stringify(characterAttributes)
        })
            .then(res => res.json())
    }
}

CharacterApi.base_url = "http://localhost:3000"

class Character{
   constructor({name,characterclass_id,race_id}){
       this.name = name,
       this.characterclass_id = characterclass_id,
       this.race_id = race_id
   }

   static create(characterAttributes){
       debugger
       return CharacterApi.createCharacter(characterAttributes)
        .then(characterJSON => {
            return new Character(characterJSON).save()
        })
   }

   static getAll(){
        if(Character.all.length === 0){
            return CharacterApi.getcharacters().then(characters => {
                Character.all = characters.map(characterAttributes =>
                    new Character(characterAttributes)
                    )
                    return Character.all
            })
        } else{
            return Promise.resolve(Character.all)
        }
   }

   save(){
       Character.all.push(this)
       return this
   }

   renderCharacter(){
       let article = document.createElement('article')
        article.className = "fl w-100 w-50-m  w-25-ns pa2-ns"
        article.innerHTML = 
        `<article class="mw5 mw6-ns center pt4">
        <div class="aspect-ratio aspect-ratio--9x16 mb4">
          <div class="aspect-ratio--object cover" style="background:url(${this.character.img_url}) center;"></div>
          <div class="aspect-ratio--object cover" style="background:url(${this.race.img_url}) center;"></div>
        </div>
      </article>
      </article>
        <a href="#0" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.characterclass.name}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
        </a>`
   }
}

class CharacterPage{
    constructor(characters) {
        this.characters = characters
    }
    
    renderForm(){
        return `<div class="pa4-l">
        <form id="createCharacter" class="createCharacter bg-light-red mw7 center pa4 br2-ns ba b--black-10">
        <fieldset class="cf bn ma0 pa0">
        <label for="CharacterName">Name: </label>
        <input type="text" ="name" id="name"/>
        <p>
        <label for="cars">Choose a Class:</label>
        <select id="characterclass">
          <option value="Barbarian">Barbarian</option>
          <option value="Bard">Bard</option>
          <option value="Cleric">Cleric</option>
          <option value="Druid">Druid</option>
          <option value="Fighter">Fighter</option>
          <option value="Monk">Monk</option>
          <option value="Paladin">Paladin</option>
          <option value="Ranger">Ranger</option>
          <option value="Rouge">Rouge</option>
          <option value="Sorcerer">Sorcerer</option>
          <option value="Wizard">Wizard</option>
          <option value="Warlock">Warlock</option>
        </select>
        </p>
        <p>
        <label for="races">Choose a race:</label>
         <select id="races>
             <option value="Dragongborn">Dragongbor</option>
             <option value="Dwarf">Dwarf</option>
             <option value="Elf">Elf</option>
             <option value="Gnome">Gnome</option>
             <option value="Half-Elf">Half-Elf</option>
             <option value="Half-Orc">Half-Orc</option>
             <option value="Halfling">Halfling</option>
             <option value="Human">Human</option>
             <option value="Tiefling">Tiefling</option>
         </select>
        </p>
        <input type="submit" value="Create Character" />
        </form>
        </fieldset>
        </div>`
    }
    renderCharacterList(){
        return this.characters.map(character =>{
            return character.renderCharacter()
        }).join('')
    }

    render(){
        return `
        ${Navbar.renderNavbar()}
        <h3>Characters</h3>
        ${this.renderForm()}
        <section id="characters">
            ${this.renderCharacterList()}
        </section>
        `
    }
}


Character.all = []

class Characterclass {
    constructor({id,name,hit_die,img_url}){
        this.id = id,
        this.name = name.charAt(0) + name.slice(1)
        this.hit_die = hit_die
        this.img_url = img_url
    }

    static getAll(){
        if (Characterclass.all.length === 0){
            return CharacterApi.getCharacterClasses().then(characters =>{
                Characterclass.all = characters.map(characterAttributes =>
                    new Characterclass(characterAttributes)
                )
                return Characterclass.all
            })
        } else{
            return Promise.resolve(Characterclass.all)
        }
    }

    static findByName(name){
        return Characterclass.all.find(characterclass => characterclass.name == name)
    }

    renderCharacterclass(){
        let article = document.createElement('article')
        article.className = "fl w-100 w-50-m  w-25-ns pa2-ns"
        article.innerHTML = 
        `
        <article class="mw5 mw6-ns center pt4">
        <div class="aspect-ratio aspect-ratio--9x16 mb4">
          <div class="aspect-ratio--object cover" style="background:url(${this.img_url}) center;"></div>
        </div>
      </article>
      </article>
        <a href="${CharacterApi.base_url}/characterclasses/${this.id}" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
            <h3 class="f6 f5 fw4 mt2 black-60">Hit-die - ${this.hit_die}</h3>
        </a>`
        return article.outerHTML
    }
}

class CharacterclassShowPage {
    constructor(characterclass){
        this.characterclass = characterclass
    }
    
}

Characterclass.all = []

class Race {
    constructor({id,name,speed,age,alignment,size_description,language_desc}) {
        this.id = id,
        this.name = name,
        this.speed =  speed,
        this.age = age,
        this.alignment = alignment,
        this.size_description = size_description,
        this.language_desc = language_desc
    }

    static getAll(){
        if (Race.all.length === 0){
            return CharacterApi.getRaces().then(races =>{
                Race.all = races.map(raceAttributes =>
                    new Race(raceAttributes)
                )
                return Race.all
            })
        } else{
            return Promise.resolve(Race.all)
        }
    }

    static findByName(name){
        return Race.all.find(characterRace => characterRace.name == name)
    }

    renderRace () {
        let article = document.createElement('article')
        article.className = "fl w-100 w-50-m  w-25-ns pa2-ns"
        article.innerHTML = 
        `<div class="aspect-ratio aspect-ratio--9x16 mb4">
          <div class="aspect-ratio--object cover" style="background:url(${this.img_url}) center;"></div>
        </div>
        <a href="#0" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.speed}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.alignment}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.size_description}</h3>
            <h3 class="f5 f4-ns mb0 black-90">${this.language_desc}</h3>
        </a>`
        return article.outerHTML
    }
}

Race.all = []

class RacePage {
    constructor(races){
        this.races = races
    }

    renderList(){
        return this.races.map(race =>{
            return race.renderRace()
        }).join('')
    }

    render(){
        return `
        ${Navbar.renderNavbar()}
        <h3>Races</h3>
        <section id="races">
            ${this.renderList()}
        </section>
        `
    }
}

class CharacterclassesPage{
    constructor(characterclasses){
        this.characterclasses = characterclasses
    }

    render() {
        return `
        ${Navbar.renderNavbar()}
        <section id="characterclasses">
            ${this.renderList()}
        </section>`
    }

    renderList () {
        return this.characterclasses.map(characterclass => {
            return characterclass.renderCharacterclass()
        }).join('')
    }
}

class Proficiencies {
    constructor({name,category}){
        this.name = name,
        this.category = category
    }
}

Proficiencies.all = []

class Navbar {
    static renderNavbar(){
        return`
        <header class="bg-white black-80 tc pv4 avenir">
        <a href="" class="bg-black-80 ba b--black dib pa3 w2 h2 br-100">
        </a>
        <h1 class="mt2 mb0 baskerville i fw1 f1">DnD Character Creator</h1>
        <nav class="bt bb tc mw7 center mt4">
          <a id="characterclasses" class="f6 f5-l link bg-animate black-80 hover-bg-light-green dib pa3 ph4-l" href="${CharacterApi.base_url}/characterclasses">Classes</a>
          <a id="characters" class="f6 f5-l link bg-animate black-80 hover-bg-light-blue dib pa3 ph4-l" href="${CharacterApi.base_url}/characters">Characters</a>
          <a id="races" class="f6 f5-l link bg-animate black-80 hover-bg-light-pink dib pa3 ph4-l" href="${CharacterApi.base_url}/races">Races</a>
        </nav>
        </header>`
    }
}

window.addEventListener("DOMContentLoaded",(event) =>{
    let root = document.getElementById('root')
    Characterclass.getAll().then(characters =>{
        root.innerHTML = new CharacterclassesPage(characters).render()
    })
    document.addEventListener('click',(e) =>{
        e.preventDefault()
        if(e.target.matches('#characters')){
            Character.getAll().then(characters =>{
                root.innerHTML = new CharacterPage(characters).render()
            })
        }
        if(e.target.matches('#races')){
            Race.getAll().then(races =>{
                root.innerHTML = new RacePage(races).render()
            })
        }
        if(e.target.matches('#characterclasses')){
            Characterclass.getAll().then(characters =>{
                root.innerHTML = new CharacterclassesPage(characters).render()
            });
        } 
        
    })
    document.addEventListener('submit',(e) => {
                debugger
                if(e.target.matches('#createCharacter')){
                    characterName = document.getElementById('name').value
                    characterClassName =document.getElementById('characterclass').value
                    characterRace = document.getElementById('races').value
                    characterClass = Characterclass.findByName(characterClassName)
                    characterRace = Race.findByName(characterRace)
                    FormData = {
                        name: characterName,
                        characterclass_id: characterClass.id,
                        race_id: characterRace
                    }
                        Character.create(FormData)
                        .then(character =>{
                            document.querySelector('#characters').insertAdjacentHTML('beforeend', character.renderCharacter)
                        })
                    }
            })
    
})