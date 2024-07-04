import numpy as np
cimport numpy as np
from sklearn.neighbors import NearestNeighbors

cdef class RecommendationSystemCython:
    cdef np.ndarray ratings_data
    cdef object model

    def __init__(self, np.ndarray ratings_data):
        self.ratings_data = ratings_data
        self.model = NearestNeighbors(metric='cosine', algorithm='brute')
        self.model.fit(ratings_data)

    def recommend(self, int user_id, int n_recommendations=5):
        cdef np.ndarray distances, indices
        distances, indices = self.model.kneighbors(self.ratings_data[user_id, :].reshape(1, -1), n_neighbors=n_recommendations+1)
        cdef list recommendations = []
        for i in range(1, len(distances.flatten())):
            recommendations.append((indices.flatten()[i], distances.flatten()[i]))
        return recommendations
