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
                        img_url
                    }
                },
                included
            } = json
            return {
                id,
                name,
                hit_die,
                img_url,
                proficiencies: included.map(({id,attributes: {name, category}})=>{
                    return {
                        id,
                        name,
                        category
                    }
                }) 
            }
        })
    }

}

CharacterApi.base_url = "http://localhost:3000"

class RaceApi{
    static getRaces(){
        
    }
}

window.addEventListener("DOMContentLoaded",(event) =>{
    let root = document.getElementById('root')
    CharacterApi.getCharacterClasses()
})