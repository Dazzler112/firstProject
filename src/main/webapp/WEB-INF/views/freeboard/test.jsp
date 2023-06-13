<div class="container-lg">
    <div class="row justify-content-center">
        <div class="col-10 col-md-12 col-lg-14">
            
            <table class="table">
                <thead>
                    <tr>
                        <th style="display:none;">게시번호</th>
                        <th>카테고리</th>
                        <th>지역</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${boardList}" var="board">
                        <tr>
                            <td style="display:none;">${board.id }</td>
                            <td>${board.boardCategory }</td>
                            <td>${board.region }</td>
                            <td>
                            <a href="/freeboard/id/${board.id}">${board.title }</a>
                            
                            <c:if test="${board.fileCount > 0 }">
                                <span class="image_column">
                                <i class="fa-regular fa-image"></i>
                                    ${board.fileCount}
                                </span>
                            </c:if>
                            
                            <c:if test="${board.commentCount > 0 }">
                                <span class="comment_column">
                                <i class="fa-solid fa-comment-dots"></i>
                                    ${board.commentCount }
                                </span>
                            </c:if>
                            
                            </td>
                            <td>${board.writer }</td>
                            <td>${board.inserted }</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>