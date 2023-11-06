import { featureProductNav } from "../Data/featureProductNav.js";
import {imageSlider} from "../Data/ImageSlider.js"
import {electronicsProductData} from "../Data/electronicProduct.js"

let input_search=document.getElementById("search_input")
let form_search=document.getElementById("search_form")
let recent_searchEl=document.querySelector(".recent_search")
let recentArray=["mobile","phone"]
form_search.addEventListener("submit",(e)=>{
	e.preventDefault()
	recentArray.unshift(input_search.value) 
	console.log(recentArray);
	renderrecent()
})

function renderrecent(){
	let recent_search_html='';
	recentArray.forEach(el=>{
		recent_search_html+= `
			<div class="recent_list">
				<i class="fa fa-search"></i>
				<p>${el}</p>
			</div>	
			`
	})
	recent_searchEl.innerHTML=recent_search_html;
}
renderrecent()


/****Image Slider */
let imageSliderListEl=document.querySelector(".imageSliderList")
let imageSliderListHTML=''
imageSlider.forEach(el=>{
	imageSliderListHTML+=`<div class="imageSliderItem">
							<a href="${el.link}">
								<img src="${el.img}"/>
							</a>
						  </div>` 
})
imageSliderListEl.innerHTML=imageSliderListHTML;
let preve_imageBtnEl=document.getElementById("preve_imageBtn")
let next_imageBtnEl=document.getElementById("next_imageBtn")
let start=0;
let end=-200;
preve_imageBtnEl.addEventListener("click",handlePreveImage)
next_imageBtnEl.addEventListener("click",handleNextImage)

function handlePreveImage(){
	let imageAllList=document.querySelectorAll(".imageSliderItem")
	if(start<0)
	start+=100
	imageAllList.forEach(el=>{
		el.style.transform=`translateX(${start}%)`
	})
}
function handleNextImage(){
	let imageAllList=document.querySelectorAll(".imageSliderItem")
	if(start>end)
	start-=100
	imageAllList.forEach(el=>{
		el.style.transform=`translateX(${start}%)`
	})
}
function renderImageSlider(){
	if(start>end){
		handleNextImage()
	}else{
		start=100
	}
}
setInterval(renderImageSlider,5000)

let bestofElectronic_product_itemEl=document.querySelector(".bestofElectronic_product_item")
let bestofElectronic_product_html=""
electronicsProductData.forEach(el=>{
	bestofElectronic_product_html+=`		
			<div class="bestofElectronic_items">
				<div class="bestofElectronic_image_Product">
					<img src="${el.img}"/>
				</div>
				<div class="bestofElectronicmoreOption">
					<p class="bestofElectronicProduct_name">${el.name}</p>
					
					<p class="bestofElectronicProduct_brand">${el.brand}</p>
				</div>                        
			</div>		
	    `
})
bestofElectronic_product_itemEl.innerHTML=bestofElectronic_product_html 
