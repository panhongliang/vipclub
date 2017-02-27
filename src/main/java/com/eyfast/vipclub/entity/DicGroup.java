package com.eyfast.vipclub.entity;

public class DicGroup {
    private Integer id;

    private Integer dicKey;

    private String dicName;

    private String dicGroup;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDicKey() {
        return dicKey;
    }

    public void setDicKey(Integer dicKey) {
        this.dicKey = dicKey;
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName == null ? null : dicName.trim();
    }

    public String getDicGroup() {
        return dicGroup;
    }

    public void setDicGroup(String dicGroup) {
        this.dicGroup = dicGroup == null ? null : dicGroup.trim();
    }
}