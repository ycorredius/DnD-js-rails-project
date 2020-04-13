class CharacterApi{
    static getCharacterClasses () {
        return fetch(`${CharacterApi.base_url}/characterclasses`)
                .then(res => res.json())
    }

    static getRaces (){
        return fetch(`${CharacterApi.base_url}/races`)
                .then(res => res.json())
    }

    get getcharacters(){
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
   constructor({name,characterclass_id}){
       this.name = name,
       this.characterclass_id = characterclass_id
   }

   static create(characterAttributes){
       debugger
       return CharacterApi.createCharacter(characterAttributes)
        .then(characterJSON => {
            return new Character(characterJSON).save()
        })
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
        </div>
      </article>
      </article>
        <a href="#0" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
        </a>`
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
        `<article class="mw5 mw6-ns center pt4">
        <div class="aspect-ratio aspect-ratio--9x16 mb4">
          <div class="aspect-ratio--object cover" style="background:url(${this.img_url}) center;"></div>
        </div>
      </article>
      </article>
        <a href="#0" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
        </a>`
       
        return article.outerHTML
    }
}

Characterclass.all = []

class Race{
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
}

Race.all = []

class CharacterclassesPage{
    constructor(characterclasses){
        this.characterclasses = characterclasses
    }

    renderForm(){
        return `<div class="pa4-l">
        <form class="createClass bg-light-red mw7 center pa4 br2-ns ba b--black-10">
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
        <input type="submit" value="Create Character" />
        </fieldset>
        </form>
        </div>`
    }

    render() {
        return `<h2> Welcome to the DnD Character Creator</h2>
            ${this.renderForm()}
        <section id="characterclasses">
            ${this.renderList()}
        </section>`
    }
    renderList () {
        return this.characterclasses.map(characterclass => {
            return characterclass.renderCharacterclass()
        })
    }

    
}

window.addEventListener("DOMContentLoaded",(event) =>{
    let root = document.getElementById('root')
    Characterclass.getAll().then(characters =>{
        root.innerHTML = new CharacterclassesPage(characters).render()
    })
    document.addEventListener('submit',(e) => {
        e.preventDefault()
        characterName = document.getElementById('name').value
        characterClassName =document.getElementById('characterclass').value
        characterClass = Characterclass.findByName(characterClassName)
        FormData = {
            name: characterName,
            characterclass_id: characterClass.id
        }
        Character.create(FormData)
    }).then(character =>{
        root.innerHTML = new Character(character).renderCharacter()
    }) 
    document.addEventListener('click', (e)=> {
        e.preventDefault()
    })
})