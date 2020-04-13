// class Page{
//     constructor(characterclasses){
//         this.characterclasses = characterclasses
//     }

//     static renderForm(){
//         return `
//         <div class="pa4-l">
//         <form class="bg-light-red mw7 center pa4 br2-ns ba b--black-10">
//         <fieldset class="cf bn ma0 pa0">
//         <label class="character">Name</label>
//         <input type="text" name="name" id="title" />
//         <p>
//         <label for="cars">Choose a Class:</label>
//         <select id="characterclass">
//           <option value="Barbarian">Barbarian</option>
//           <option value="Bard">Bard</option>
//           <option value="Cleric">Cleric</option>
//           <option value="Druid">Druid</option>
//           <option value="Fighter">Fighter</option>
//           <option value="Monk">Monk</option>
//           <option value="Paladin">Paladin</option>
//           <option value="Ranger">Ranger</option>
//           <option value="Rouge">Rouge</option>
//           <option value="Sorcerer">Sorcerer</option>
//           <option value="Wizard">Wizard</option>
//           <option value="Warlock">Warlock</option>
//         </select>
//         </p>
//         <p>
//         <label for="races">Choose a race:</label>
//         <select id="races>
//             <option value="Dragongborn">Dragongbor</option>
//             <option value="Dwarf">Dwarf</option>
//             <option value="Elf">Elf</option>
//             <option value="Gnome">Gnome</option>
//             <option value="Half-Elf">Half-Elf</option>
//             <option value="Half-Orc">Half-Orc</option>
//             <option value="Halfling">Halfling</option>
//             <option value="Human">Human</option>
//             <option value="Tiefling">Tiefling</option>
//         </select>
//         </p>
//         <input type="submit" value="Create Character" />
//         </fieldset>
//         </form>
//         </div>`
//     }

//     render() {
//         return `<h1> Welcome to the DnD Character Creator</h1>
//         <h3>Create A Character</h3>
//         <section id="races">
//             ${Page.renderForm()}
//         </section>
//             <h3>Classes</h3>
//         <section id="characterclasses">
//             ${this.renderClassList()}
//         </section>
//         `
        
//     }
//     renderClassList () {
//         return this.characterclasses.map(characterclass => {
//             return characterclass.renderCharacterclass()
//         })
//     }

//     renderRaceList(){
//         return this.races.map(race => {
//             return race.renderRace()
//         })
//     }

    
// }




class Race{
    constructor({id,name,speed,age,alignment,size_description,language_desc, img_url}) {
        this.id = id,
        this.name = name,
        this.speed =  speed,
        this.age = age,
        this.alignment = alignment,
        this.size_description = size_description,
        this.language_desc = language_desc
        this.img_url = img_url
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

    renderRace () {
        let article = document.createElement('article')
        article.className = "fl w-100 w-50-m  w-25-ns pa2-ns"
        article.innerHTML = 
        `
        <div class="aspect-ratio aspect-ratio--9x16 mb4">
          <div class="aspect-ratio--object cover" style="background:url(${this.img_url}) center;"></div>
        </div>
        <a href="#0" class="ph2 ph0-ns pb3 link db">
            <h3 class="f5 f4-ns mb0 black-90">${this.name}</h3>
        </a>
        <a class="characterclassShow f4 fw6 db black link hover-navy" href="${CharacterApi.base_url}/races/${this.id}">${this.name} Information</a>`
    }

    render() {
                return `<h1> Welcome to the DnD Character Creator</h1>
                <h3>Create A Character</h3>
                <section id="races">
                    ${Page.renderForm()}
                </section>
                    <h3>Classes</h3>
                <section id="characterclasses">
                    ${this.renderClassList()}
                </section>
                `
    }
}