/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

import java.util.List;

/**
 *
 * @author khang
 */
public interface ICRUD<T> {

    boolean isExisted(String phone, String password);

    void add(T items, String password);

    void update(T items);

    void remove(String phone);

    List<T> getAll();

    List<T> searchByName(String name);

    T searchByPhone(String phone);

    void changePassword(String phone, String name);
}
