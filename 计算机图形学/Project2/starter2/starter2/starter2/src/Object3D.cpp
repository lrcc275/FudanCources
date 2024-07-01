#include "Object3D.h"

bool Sphere::intersect(const Ray &r, float tmin, Hit &h) const
{
    // BEGIN STARTER

    // We provide sphere intersection code for you.
    // You should model other intersection implementations after this one.

    // Locate intersection point ( 2 pts )
    const Vector3f &rayOrigin = r.getOrigin(); //Ray origin in the world coordinate
    const Vector3f &dir = r.getDirection();

    Vector3f origin = rayOrigin - _center;      //Ray origin in the sphere coordinate

    float a = dir.absSquared();
    float b = 2 * Vector3f::dot(dir, origin);
    float c = origin.absSquared() - _radius * _radius;

    // no intersection
    if (b * b - 4 * a * c < 0) {
        return false;
    }

    float d = sqrt(b * b - 4 * a * c);

    float tplus = (-b + d) / (2.0f*a);
    float tminus = (-b - d) / (2.0f*a);

    // the two intersections are at the camera back
    if ((tplus < tmin) && (tminus < tmin)) {
        return false;
    }

    float t = 10000;
    // the two intersections are at the camera front
    if (tminus > tmin) {
        t = tminus;
    }

    // one intersection at the front. one at the back 
    if ((tplus > tmin) && (tminus < tmin)) {
        t = tplus;
    }

    if (t < h.getT()) {
        Vector3f normal = r.pointAtParameter(t) - _center;
        normal = normal.normalized();
        h.set(t, this->material, normal);
        return true;
    }
    // END STARTER
    return false;
}

// Add object to group
void Group::addObject(Object3D *obj) {
    m_members.push_back(obj);
}

// Return number of objects in group
int Group::getGroupSize() const {
    return (int)m_members.size();
}

bool Group::intersect(const Ray &r, float tmin, Hit &h) const
{
    // BEGIN STARTER
    // we implemented this for you
    bool hit = false;
    for (Object3D* o : m_members) {
        if (o->intersect(r, tmin, h)) {
            hit = true;
        }
    }
    return hit;
    // END STARTER
}


Plane::Plane(const Vector3f &normal, float d, Material *m) : Object3D(m) {
    // TODO implement Plane constructor
}
bool Plane::intersect(const Ray &r, float tmin, Hit &h) const
{
    const Vector3f &o = r.getOrigin(); 
    const Vector3f &d = r.getDirection();
    Vector3f T = _d * _normal - o;
    float t = Vector3f::dot(T, _normal) / Vector3f::dot(d, _normal);
    if (t < tmin)
        return false;
    else if (t < h.getT()){
        h.set(t, this->material, _normal);
        return true;
    }
    return false;
}

bool Triangle::intersect(const Ray &r, float tmin, Hit &h) const 
{
    Vector3f D = r.getDirection(), O = r.getOrigin();
    Matrix3f T(_v[1] - _v[0], _v[2] - _v[0], -D);
    Vector3f uvt = T.inverse() * (O - _v[0]);
    float u = uvt[0], v = uvt[1], t = uvt[2];
    if (u > 0 && v > 0 && u + v < 1 && t >= tmin && t < h.getT())
    {
        Vector3f normal = (1 - u - v) * _normals[0] + u * _normals[1] + v * _normals[2];
        normal = normal.normalized();
        h.set(t, this->material, normal);
        return true;
    }
    return false;
}


Transform::Transform(const Matrix4f &m,
    Object3D *obj) : _object(obj) {
    // TODO implement Transform constructor
}
bool Transform::intersect(const Ray &r, float tmin, Hit &h) const
{
    Matrix4f Im = _m.inverse();
    Vector3f D = r.getDirection(),O = r.getOrigin();
    Vector3f TransDir((Im * Vector4f(D, 0)).xyz());
    float TransTmin = tmin * TransDir.abs();
    Ray TransRay((Im * Vector4f(O, 1)).xyz(), TransDir);
    if (_object->intersect(TransRay, TransTmin, h))
    {
        Vector3f normal = (Im.transposed() * Vector4f(h.getNormal(), 0)).xyz();
        normal = normal.normalized();
        h.set(h.getT(), h.getMaterial(), normal);
        return true;
    }
    return false;
}

