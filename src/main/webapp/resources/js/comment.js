//댓글 가져오기
function getComment(info) {
    var queryString = '?board=' + info.boardId + '&page=' + info.page;

    $.ajax({
        url: info.root + 'view/comment/list' + queryString,
        type: 'get',
        success: function (map) {
            var list = map.list;
            var pagination = map.pagination;
            console.log(map);
            console.log(list);
            console.log(pagination);
            //0레벨 처리 댓글관련 추가분
            info.perPage = pagination.PER_PAGE;
            info.totalCount = pagination.totalCount + 1;
            //리스트랑 페이징 처리 관련 화면 불러오기
            commentList(list, info);
            paging(pagination, info);
        }
    })
}

//리스트를 받아서 댓글페이지 그리기
function commentList(list, info) {
    var commentId = 0;
    var commentLevel = 0;
    var str = "";

    list.forEach(function (comment, ix) {
        var date = new Date(comment.regDate);
        var level = comment.commentLevel * 30 + 10;
        if (level == 10) {
            str +=
                "<div class='comment-parent border-bottom border-gray'>" +
                "<div class='comment-main' style='margin-left:" + level + "px'>" +
                "<div class='row'>" +
                "<div class='col-sm-6'><p class='font-weight-bold h6'>" + comment.writer + "</p></div>" +
                "<div class='col-sm-6 text-right'>" + date.toLocaleString() + "</div>" +
                "</div>" +
                "<p class='font-weight-normal'>" + comment.content + "</p>" +
                "<div class='comment-footer text-right'" +
                "data-Id='" + comment.commentId + "' data-level='" + comment.commentLevel + "'>" +
                "<a class='commentform-add'><i class='fas fa-pencil-alt'></i> 답글</a></div>" +
                "</div></div>";
        } else {
            str +=
                "<div class='comment-child border-bottom border-gary'>" +
                "<div class='comment-main' style='margin-left:" + level + "px'>" +
                "<div class='row'>" +
                "<div class='col-sm-6'><p class='font-weight-bold h6'>" + comment.writer + "</p></div>" +
                "<div class='col-sm-6 text-right'>" + date.toLocaleString() + "</div>" +
                "</div>" +
                "<p class='font-weight-normal'>" + comment.content + "</p>" +
                "<div class='comment-footer text-right'" +
                "data-Id='" + comment.commentId + "' data-level='" + comment.commentLevel + "'>" +
                "<a class='commentform-add'><i class='fas fa-pencil-alt'></i> 답글</a></div>" +
                "</div></div>";
        }
    });
    $('.comments-body').append($(str));

    if (info.writer == "") {
        str =
            "<textarea class='form-control' name='content' rows='5' " +
            "disabled placeholder='답글은 로그인이 필요한 서비스 입니다.'></textarea>"
    } else {
        str =
            "<textarea class='form-control' name='content' rows='5' " +
            "placeholder='300자 이내로 입력해주세요.'>" +
            "</textarea>" +
            "<div class='text-right'>" +
            "<button type='button' " +
            "class='btn btn-light-blue btn-sm comment-add'>등록</button>" +
            "<button type='button' " +
            "class='btn btn-light-blue btn-sm original-position'>원위치</button></div>"

    }
    //댓글  추가
    $('.comments-area').append($(str));
    
    //답글버튼 누를떄마다 아이디와 레벨 얻기 레벨은 1씩 추가
    $('.commentform-add').click(function (e) {
        if (info.writer != "") {
            $(this).after($('.comments-area'));
            commentId = $(this).parent($('.comment-footer')).data('id');
            commentLevel = $(this).parent($('.comment-footer')).data('level') + 1;
        } else {
            scrollBottom();
        }
    });


    //댓글창 원위치   
    $('.original-position').click(function (e) {
        commentId = 0;
        commentLevel = 0;
        $('.comments-write').append($('.comments-area'));
        scrollBottom();
    });
    
    //댓글 작성하기
    $('.comment-add').click(function (e) {
        var content = $('[name=content]').val();

        if (content == "") {
            alert("내용을 입력해주세요.");
            return;
        }

        var comment = {
            writer: info.writer,
            boardId: info.boardId,
            content: content,
            commentRef: commentId,
            commentLevel: commentLevel
        };

        $.ajax({
            url: info.root + 'view/comment/list',
            data: JSON.stringify(comment),
            contentType: 'application/json',
            type: 'post',
            success: function (result) {
                //0레벨 댓글이 달렸을때 페이징 처리하기(처음 0레벨 댓글관련 변수가 여기서 쓰임)
                if (comment.commentLevel == 0) {
                    info.page = parseInt(Math.ceil((parseFloat(info.totalCount / info.perPage))));
                }
                //댓글 작성이 완료된후 페이지 다시 그리기
                clean();
                getComment(info);
                setTimeout(function(){
                    scrollTop();
                } , 100);
            }
        })
    })
}

//페이징 처리
function paging(pagination, info) {
    $('.comments-header').append("<i class='fas fa-comment'></i> 답글&nbsp;[" + pagination.totalCount + "]");
    var str =
        "<div class='footer'>" +
        "<nav aria-label='pagination'>" +
        "<ul class='pagination pg-blue justify-content-center'>";

    if (pagination.currentBlock > 1) {
        str +=
            "<li class='page-item'>" +
            "<a class='page-link on' aria-label='first' data-value='1'>" +
            "<span aria-hidden='true'>처음</span>" +
            "<span class='sr-only'>first</span>" +
            "</a>" +
            "</li>" +
            "<li class='page-item'>" +
            "<a class='page-link on' aria-label='Previous' " +
            "data-value='" + pagination.prevBlockPage + "'>" +
            "<span aria-hidden='true'>이전</span>" +
            "<span class='sr-only'>Previous</span>" +
            "</a>" +
            "</li>";
    }

    for (var i = pagination.startPage; i <= pagination.endPage; i++) {
        if (i == pagination.page) {
            str +=
                "<li class='page-item active'>" +
                "<a class='page-link'>" + i +
                "<span class='sr-only'>(current)</span>" +
                "</a>" +
                "</li>";
        } else {
            str +=
                "<li class='page-item'>" +
                "<a class='page-link on' data-value='" + i + "'>" + i + "</a>" +
                "</li>";
        }
    }

    if (pagination.currentBlock < pagination.totalBlock) {
        str +=
            "<li class='page-item'>" +
            "<a class='page-link on' aria-label='next' " +
            "data-value='" + pagination.nextBlockPage + "'>" +
            "<span aria-hidden='true'>다음</span>" +
            "<span class='sr-only'>next</span>" +
            "</a>" +
            "</li>" +
            "<li class='page-item'>" +
            "<a class='page-link on' aria-label='last' " +
            "data-value='" + pagination.totalPage + "'>" +
            "<span aria-hidden='true'>마지막</span>" +
            "<span class='sr-only'>last</span>" +
            "</a>" +
            "</li>"
    } else {
        str +=
            "</ul></nav></div>";
    }

    $('.comments-footer').append($(str));

    $('.page-link.on').click(function (e) {
            info.page = $(this).data('value');
            clean();
            getComment(info);
            setTimeout(function(){
                scrollTop();
            } , 100);
        }
    );
}
//스크롤 관련
function scrollTop() {
    var offset = $('.scroll-point').offset();
    offset.top -= 70;
    console.log(offset);
    $('html').animate({
        scrollTop: offset.top
    }, 400);
}
//스크롤 관련
function scrollBottom() {
    $('html').animate({
        scrollTop: $(document).height()
    }, 400);
}
//페이지를 그릴때 다시 비워두기...
function clean() {
    $('.comments-write').append($('.comments-area'));
    $('.comments-header').empty();
    $('.comments-body').empty();
    $('.comments-footer').empty();
    $('.comments-area').empty();
}