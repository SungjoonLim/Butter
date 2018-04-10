/**
 * 
 */

class FlickrApi{
	constructor(){
		this.url='https://api.flickr.com/services/rest/?jsoncallback=?';
		this.api_key='e7cdb6da4a5003e13d3f4ffc1cd8d6d6';
		this.format='json';
	}
	
	getRecent(parse){
		parse = parse || this.parse;
		var param={
			api_key: this.api_key,
			method : 'flickr.photos.getRecent',
			per_page : 20,
			format : this.format
		};
		$.getJSON(this.url,param,this.parse);
	}
	
	search(keyword,parse){
		parse = parse || this.parse;
		var param={
			api_key: this.api_key,
			method : 'flickr.photos.search',
			text : keyword,
			tags : keyword,
			safe_serch: 1,
			sort : 'interestingness-desc',
			per_page : 300,
			format : this.format
		};
		$.getJSON(this.url,param,this.parse);
	}
	
	parse(data){
		$('#panel').empty();
		
		$(data.photos.photo).each(function(i,photo){
			//작은 이미지
			var img = `http://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}.jpg`;
			//console.log(img);
			
			var img_info = `http://www.flickr.com/photos/${photo.owner}/${photo.id}/in/photostream`;
			//console.log(img_info);
			var templ = `
			<div class="col-md-4 mb-4">
				<a href="${img_info}" target="_blank">
					<img src="${img}" width="200"
						class="z-depth-4 rounded">
				</a>
			</div>
			`;
			$(templ).appendTo('#panel');
		});
	}
	
	
}









