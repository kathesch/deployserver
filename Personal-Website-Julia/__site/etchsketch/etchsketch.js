
let n = 16;

document.querySelector('button').addEventListener("click", e => {
    n = prompt("Enter a number")
    generateGrid(n)
})

let isDrawing = false
document.body.onpointerdown = () => (isDrawing = true)
document.body.onpointerup = () => (isDrawing = false)

generateGrid(n)

function generateGrid(n) {
    document.querySelector('div').innerHTML=``
    for (let i = 1; i <= n*n; i++) {
        let div = document.createElement('div');
        div.style.border = "1px dotted black";
        div.style.height = `${512/n}px`;
        div.style.width = `${512/n}px`;
        div.style.boxSizing = "border-box"
        div.style.backgroundColor = "white"
        div.style.transition = "background-color 1s ease"
        div.style.touchAction = "none"

        div.addEventListener('pointerover', changeColor)
        div.addEventListener('pointerdown', changeColor)
    
        document.querySelector('div').appendChild(div)
    }
}

function changeColor(e) {
    if (e.type === 'pointerover' && !isDrawing) return
    e.target.style.backgroundColor="black";
    e.target.releasePointerCapture(e.pointerId)
}


