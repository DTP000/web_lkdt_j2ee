<div class="row">
	<div class="text-center large-img mb-3">
		<a href="${prd.getImage()}" target="_blank"> <img
			class="img-fluid" src="${prd.getImage()}" alt="${prd.getName()}">
		</a>
	</div>
	<div class="thumb-img-owl">
		<div id="gallery_product" class="owl-carousel owl-theme">
			<c:forEach items="${prdImgs}" var="prdImg">
				<div class="item">
					<a href="#"> <img class="img-fluid" src="${prdImg.getUrl()}"
						alt="">
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>