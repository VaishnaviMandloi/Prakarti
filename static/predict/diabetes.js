document.getElementById("tdpreg").preg();
const genders = document.querySelector('.gender')

genders.forEach((gender,idx) => {
    gender.addEventListener('click', () => (idx))
})

function preg(){
    if(gender=='male'){
        style.display = "none"
    }
}
