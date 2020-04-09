function getroot() {
    return document.querySelector('#root')
}

window.addEventListener("DOMContentLoaded",(event) =>{
    fetch("http://localhost:3000/characterclasses")
        .then(res => res.json())
        .then(json => {
            debugger
        })
    // getroot()
})