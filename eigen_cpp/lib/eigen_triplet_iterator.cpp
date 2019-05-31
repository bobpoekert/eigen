#include <iterator>

template <class t_elt> class TripletIterator : public std::iterator<std::input_iterator_tag, Triplet<t_elt>>
{
    size_t size;
    INDEX *xs;
    INDEX *ys;
    t_elt *vs;
    size_t idx;

    public:

    TripletIterator(size_t size, INDEX *xs, INDEX *ys, t_elt *vs)
    {
        this.xs = xs;
        this.ys = ys;
        this.vs = vs;
        this.idx = 0;
    }

    TripletIterator(const TripletIterator& mit) 
    {
        this.size = mit.size;
        this.xz = mit.xs;
        this.ys = mit.ys;
        this.vs = mit.vs;
        this.idx = mit.idx;
    }

    TripletIterator& operator++()
    {
        this.idx++;
        return *this;
    }

    TripletIterator operator++(int)
    {
        TripletIterator tmp(*this);
        operator++();
        return tmp;
    }

    bool operator==(const TripletIterator& rhs) const
    {
        return (size == rhs.size) && (xs == rhs.xs) && (ys == rhs.ys) && (vs == rhs.vs) && (idx == rhs.idx);
    }

    bool operator!=(const TripletIterator& rhs) const
    {
        return (size != rhs.size) || (xs != rhs.xs) || (ys != rhs.ys) || (vs != rhs.vs) || (idx != rhs.idx);
    }

    Triplet<t_elt>& operator*()
    {
        return Triplet<t_elt>(this.xs[this.idx], this.ys[this.idx], this.vs[this.idx]);
    }

    TripletItearator<t_elt> begin()
    {
        return TripletIterator<t_elt>(this.size, this.xs, this.ys, 0);
    }

    TripletIterator<t_elt> end()
    {
        return TripletIterator<t_elt>(this.size, this.xs, this.ys, this.size - 1);
    }


}