#include "Material.h"
Vector3f Material::shade(const Ray &ray,
    const Hit &hit,
    const Vector3f &dirToLight,
    const Vector3f &lightIntensity)
{
    Vector3f N = hit.getNormal();
    float clampLN = std::max(0.0f, Vector3f::dot(dirToLight, N));
    Vector3f diffuse = clampLN * lightIntensity * _diffuseColor;
    Vector3f E = -ray.getDirection();
    Vector3f R = 2.0 * Vector3f::dot(E, N) * N - E;
    float clampLR = std::max(0.0f, Vector3f::dot(dirToLight, R));
    Vector3f specular = pow(clampLR, _shininess) * lightIntensity * _specularColor;
    return diffuse + specular;
}


