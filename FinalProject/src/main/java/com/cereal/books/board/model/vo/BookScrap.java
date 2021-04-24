package com.cereal.books.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookScrap {
    private int scrapNo;

    private int userNo;

    private String bsIsbn;

    private String scrapStatus;
}