# from .recommendation_cython import RecommendationSystemCython

# ratings_data = load_ratings_data().values
# recommendation_system_cython = RecommendationSystemCython(ratings_data)

# def recommend_products_cython(request, user_id):
#     user = Customer.objects.get(id=user_id)
#     recommendations = recommendation_system_cython.recommend(user_id)
#     recommended_products = [Product.objects.get(id=idx) for idx, _ in recommendations]
#     return render(request, 'recommendations.html', {'recommended_products': recommended_products})
# # 