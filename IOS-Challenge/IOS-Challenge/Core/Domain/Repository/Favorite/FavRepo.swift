//
//  FavRepo.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//


protocol FavRepo {
    func getFavorites() async throws -> [FavoriteModel]
    func addToFavorite(favorite : FavoriteModel) async throws
    func isFavorite(item: FavoriteModel) async throws -> Bool
    func removeFavorite(item: FavoriteModel) async throws

}